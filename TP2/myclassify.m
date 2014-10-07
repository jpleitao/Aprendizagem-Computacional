%%%%
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
%%
%%	The main difference between this two architectures is the presence of the associative memory on the first architecture. This associative
%%	memory can be seen as a sort of "filter" or "corrector" of the given input character: If it is not perfect, then the associative memory
%%	provides an output character that is "more perfect". The associative memory consists of a single layer neural network, with linear
%%	activation function, and with no bias. The classifier is a perceptron implemented as a neural network.
%%
%%	In both implementations of the classifier has a bias in each neuron, and the user is prompted to select the properties of the network,
%%	such as activation and perform function, and learning method (in case of the perceptron implementation).
%%
%%	The classification of each given input will go as follows:
%%	- If the user selects to use an associative memory, then the input will be passed to the associative memory, which will "purify" it
%%	- Next, if no previously trained network is given, the user is prompted to select the desire architecture and properties of the
%%	  classifier's neural network, which will be created and trained
%%	- The input, purified or not, will be presented to the classifier, which will perform its classification, which is then returned, in order
%%	  to be presented to the user, in the mpaper function
%%%%
function my_return = myclassify(data_, filled_)

	data_ = data_(:, filled_);

%================================================Check for Associative Memory===============================================

	load('user_associative_choice.mat');
	if (associative == 1)
		load('associative_weights.mat');
		data_ = associative_W * data_;
	end

%=====================================================Ask Parameters==========================================================

	%Activation Function
	keep_going = 1;
	while (keep_going == 1)
		temp = input('\nSelect the desired activation function.\n1 - sigmoidal\n2 - linear\n3 - Hard-limit\n');
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

%=====================================================Verify Network========================================================

	%Check if network has already been created
	if (associative == 1)
		network_name = strcat('net_AM', activation_function,'_', learning_method, '.mat');
	else
		network_name = strcat('net_noAM_', activation_function,'_', learning_method, '.mat');
	end
	if exist(network_name, 'file') == 2
		load(network_name);
	else
		%Create the neural network and train it
		network_ = createNetwork(data_, activation_function, learning_method);
		%After the training the final weights and bias can be accessed by "network_.IW" and "network_.b"

		%Save the function
		save(network_name, 'network_');
	end

%=====================================================Classify Data==========================================================

	result = sim(network_, data_);
	[lines, total_cases] = size(data_);

	my_return = ones(1,total_cases) * -1;%Initialize each element of the vector

	current_case = 1;
	while (current_case <= total_cases)

		case_result = find(result(:, current_case) == max(result(:, current_case)));
		my_return(current_case) = case_result(1);
		current_case = current_case + 1;
	end


%{
	%Make the classification: Run sim and then set the results in the format excpeted by ocr_func
	result = sim(network_, data_)

	% Set the result into the format expected by ocr_fun
	total_cases = length(filled_);

	%Row vector with the same number of collumns as the number of filled squares, with the correspondent class
	my_return = ones(1,total_cases) * -1;%Initialize each element of the vector

	current_case = 1;
	while (current_case <= total_cases)
		%In each collumn, result should have only one value filled, with the class of the corresponding test
		case_result = find(result(:,filled_(current_case)) == max(result(:,filled_(current_case))));
		
		if (length(case_result) > 0)%FIXME
			my_return(current_case) = case_result(1);
		end
		
		current_case = current_case + 1;
	end	

%}
end