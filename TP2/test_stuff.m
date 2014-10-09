%%%%
%% Script to run the test cases
%%%%
function my_return = test_stuff()

	%Ask the user if using associative memory or not
	associative = 0;
	while ( (associative ~= 1) && (associative ~= 2))
		associative = input('Select the desired architecture\n1 - With associative memory\n2 - Without associative memory\n');
	end

	%Save the user's choice
	save('user_associative_choice.mat', 'associative');

	if (associative == 1)

		training_dimension = 0;
		while ( (training_dimension ~= 1) && (training_dimension ~= 2))
			training_dimension = input('\nSelect the dimensions of the training data:\n1 - 500 test-cases\n2 - 100 test-cases\n');
		end

		if (training_dimension == 1)
			dimension = 500;
			save('dimension.mat', 'dimension');
		else
			dimension = 100;
			save('dimension.mat', 'dimension');
		end

		%Check the type of training to perform in the associative memory
		training_type = 0;
		while ( (training_type ~= 1) && (training_type ~= 2))
			training_type = input('\nSelect the desired training method\n1 - Transpose\n2 - Pinv\n');
		end

		%Save the training type
		save('AM_Training_Type.mat', 'training_type');
	end

	load('myInput.mat');
	load('myFilled.mat');
	my_return = myclassify(P, filled);
end