%%%%
%%	Function that handles all the classification, for a given set of cases.
%%	This function receives the data to classify, which results from the "mpaper" function, where the user had to draw some numbers by
%%	hand in a given table; An array with the positions in the table where the user didn't draw anything; A previously created and
%%	trained neural network (this last argument is optional, and if not provided one neural network will be created and trained with a
%%	previously defined set of training examples).
%%
%%	EXPLAIN HOW DOES THIS FUNCTION WORKS. TODO
%%%%
function my_return = myclassify(data_, filled_, network_)

%=====================================================Get Target Output=====================================================
	%Get the target output. Load the 'Tfinal.mat' file, containing the expected results for the input
	load('Tfinal.mat');
	Tfinal_mine = Tfinal;

%================================================Check for Associative Memory===============================================

	%Ask the user if using associative memory or not
	associative = 0;
	while ( (associative ~= 1) && (associative ~= 2))
		associative = input('Select the desired architecture\n1 - With associative memory\n2 - Without associative memory\n');
	end

	%%Check which architecture to use (with or without associative memory)
	if (associative == 1)
		data_ = associativeMemory(data_, Tfinal_mine);
	end

%=====================================================Verify Network========================================================

	if nargin < 3
		%No network given, so let's create one and train it with our training examples

		%Get network information
		network_type = 0;
		while ((network_type ~= 1) && (network_type ~= 2))
			network_type = input('Select the desired network type\n1 - Feedforward Neural Network\n2 - Perceptron\n');
		end

		%Create the neural network and train it
		network_ = createNetwork(network_type, data_);
		%After the training the final weights and bias can be accessed by "network_.IW" and "network_.b"
	end

%=====================================================Classify Data==========================================================

	%Make the classification: Run sim and then set the results in the format excpeted by ocr_func
	result = sim(network_, data_);

	% Set the result into the format expected by ocr_fun
	total_cases = length(filled_);

	[nP, nCases] = size(data_);

	%Row vector with the same number of collumns as the number of filled squares, with the correspondent class
	my_return = ones(1,total_cases) * -1;%Initialize each element of the vector

	current_case = 1;
	while (current_case <= total_cases)
		%In each collumn, result should have only one value filled, with the class of the corresponding test
		case_result = find(result(:,filled_(current_case)) == max(result(:,filled_(current_case))))
		if (length(case_result) == 1)
	    	my_return(current_case) = case_result;
		end

		current_case = current_case + 1;
	end	
end