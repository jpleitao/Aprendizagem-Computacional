%%%%
%%	Function that handles all the classification, for a given set of cases.
%%	This function receives the data to classify, which results from the "mpaper" function, where the user had to draw some numbers by
%%	hand in a given table; An array with the positions in the table where the user didn't draw anything; A previously created and
%%	trained neural network (this last argument is optional, and if not provided one neural network will be created and trained with a
%%	previously defined set of training examples).
%%%%
function my_return = myclassify(data_, filled_, network_)

%=====================================================Get Target Output=====================================================
	%Get the target output. Load the 'Tfinal.mat' file, containing the expected results for the input
	load('Tfinal.mat');
	Tfinal_mine = Tfinal;

%================================================Check for Associative Memory===============================================

	%Ask the user if using associative memory or not
	associative = 0;
	while associative ~= 1 or associative ~= 2
		associative = input('Select the desired architecture (1 - With associative memory; 2 - Without associative memory):\n');
	end

	%%Check which architecture to use (with or without associative memory)
	if (associative_ == 1)
		data_ = associativeMemory(data_, Tfinal_mine);
	end

%=====================================================Verify Network========================================================

	if nargin < 3
		%No network given, so let's create one and train it with our training examples

		%Get network information
		network_type = 0;
		while network_type ~= 1 or network_type ~= 2
			network_type = input('Select the desired network type (1 - Feedforward Neural Network; 2 - Perceptron):\n');
		end

		nA = 10;
		[nP, nCases] = size(data_);

		%Create the neural network and train it
		network_ = createNetwork(network_type, nA, nP);
		trainNetwork(network_, data_, nCases);
		%After the training the final weights and bias can be accessed by "network_.IW" and "network_.b"
	end

%=====================================================Classify Data==========================================================

	%Make the classification: Run sim and then set the results in the format excpeted by ocr_func


end