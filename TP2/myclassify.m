%%%%
%%
%%	João Tiago Márcia do Nascimento Fernandes 	2011162899
%%	Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%	Function that handles all the classification, for a given set of cases.
%%	This function receives the data to classify, which results from the "mpaper" function, where the user had to draw some numbers by
%%	hand in a given table; An array with the positions in the table where the user didn't draw anything; A previously created and
%%	trained neural network (this last argument is optional, and if not provided one neural network will be created and trained with a
%%	previously defined set of training examples).
%%	We now give a more detailed explanantion of our approach to the classification.
%%
%%	Our approach to the classification is as follows:
%%	Before doing any sort of classification of the given inputs, the user is prompted to select the desired neural networks architectures.
%%	There are two available architectures:
%%		- One composed of an associative memory and a classifier
%%		- Another, just composed of a single classifier
%%	In both implementations of the classifier has a bias in each neuron, and the user is prompted to select the properties of the network,
%%	such as activation and perform function, and learning method (in case of the perceptron implementation).
%%
%%	The main difference between this two architectures is the presence of the associative memory on the first architecture. This associative
%%	memory can be seen as a sort of "filter" or "corrector" of the given input character: If it is not perfect, then the associative memory
%%	provides an output character that is "more perfect". The associative memory consists of a single layer neural network, with linear
%%	activation function, and with no bias. The classifier is a perceptron implemented as a neural network.
%%
%%	Both the associative memory and classifier can have already been created and trained. If, at execution time, no associative memory and/or
%%	have been previously created, then they are created, trained and saved to a file. On the other hand, if at execution time, the
%%	application detects that the associative memory or the network it will need has already been created and trained, that network (or
%%	associative memory) is loaded and used instead.
%%
%%	The classification of each given input will go as follows:
%%	- If the user selects to use an associative memory, then the input will be passed to the associative memory, which will "purify" it.
%%	  Like we mentioned before, if the application detects that one associative memory has already been created, trained and save, it
%%	  loads that one in memory, and uses it instead. If no associative memory has been created, one is created, trained, saved and is
%%	  is the one used from that point on the execution
%%	- Next, if no previously trained network is given, the user is prompted to select the desire architecture and properties of the
%%	  classifier's neural network, which will be created, trained and saved. If, on the other hand, one has already been created and
%%	  trained, that one is loaded in memory and used from that point on the execution. We want to call the reader's attention to the fact
%%	  that because different activation functions can be selected for the network, and each network can be associated or not with an 
%%	  associative memory, our application is distinguishing the created neural networks according to their associated activation function
%%	  an with the presence, or not of an associative memory filtering the network's input data.
%%	- The input, purified or not, will be presented to the classifier, which will perform its classification, which is then returned,
%%	  in order to be presented to the user, in the mpaper function
%%%%
function my_return = myclassify(data_, filled_)

	%Just consider the collumns correspondent to the squares filled in the grid by the user
	data_ = data_(:, filled_);

%===============================================Check for Associative Memory================================================================
	
	%Check if the user has selected to use or not an associative memory to "purify" the input data
	load('user_associative_choice.mat');
	if (associative == 1)
		%If the user has selected to use associative memory then we have already computed and stored its weights, which we now can access

		%Load the associative memory training type
		load('AM_Training_Type.mat');

		if (training_type == 1)
			%Load the weights of the Hebb training type
			load('associative_weights_Transpose.mat');
		else
			%Load the weights of the pinv training type
			load('associative_weights_Pinv.mat');
		end

		%Apply the associative memory to purify the input
		data_ = associative_W * data_;
	end

%=====================================================Ask Parameters=========================================================================

	%Ask the user for the classifier's activation Function
	keep_going = 1;
	while (keep_going == 1)
		temp = input('\nSelect the desired activation function.\n1 - sigmoidal\n2 - linear\n3 - hard-limit\n');
		if (temp == 1)
			activation_function = 'logsig';
			break;
		elseif (temp == 2)
			activation_function = 'purelin';
			break;
		elseif (temp == 3)
			activation_function = 'hardlim';
			break;
		end
	end

	%Learning Method - "The neural network parameters should be evaluated using the perceptron rule (learnp), if harlim is used,
	%					or the gradient method (learngd) if purlin or logsig are used"
	if (temp == 3)
		learning_method = 'learnp';
	else
		learning_method = 'learngd';
	end

%=====================================================Verify Network=========================================================================

	%Check if network has already been created -- If it has load the correspondent network. Otherwise create, train and save one
	load('dimension.mat');
	load('AM_Training_Type.mat');
	if (associative == 1)
		network_name = strcat('net_AM_T_', num2str(training_type), '_', num2str(dimension), '_', activation_function,'_', learning_method, '.mat');
	else
		network_name = strcat('net_noAM_', num2str(dimension), '_', activation_function, '_', learning_method, '.mat');
	end

	if exist(network_name, 'file') == 2
		load(network_name);
	else
		%Create the neural network and train it
		network_ = createNetwork(activation_function, learning_method);

		%Save the function
		save(network_name, 'network_');
	end

%=====================================================Classify Data==========================================================================

	%Send the data to the classifier, to perform the classification
	result = sim(network_, data_);

	%%%%
	%%	Handle the mapping between the sim's output and the expected output for this function (line vector, with the classification)
	%%	of each character drawn by the user
	%%%%
	[lines, total_cases] = size(data_);

	%This is our return variable, so let's initialize it! We initialize to -1 so that it isn't drawn by showim
	my_return = ones(1,total_cases) * -1;

	%Go throught the sim's output and get each case's classification
	current_case = 1;
	while (current_case <= total_cases)

		case_result = find(result(:, current_case) == max(result(:, current_case)));
		
		%NOTE: If there is more than one classification for the current case then just consider the first one (FIXME?)
		if (length(case_result) == 1)
			my_return(current_case) = case_result(1);
		end

		current_case = current_case + 1;
	end
end