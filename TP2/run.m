%%%%
%% Script to run the application
%%%%

%================================================Check for Associative Memory===============================================
%Ask the user if using associative memory or not
associative = 0;
while ( (associative ~= 1) && (associative ~= 2))
	associative = input('Select the desired architecture\n1 - With associative memory\n2 - Without associative memory\n');
end

%Save the user's choice
save('user_associative_choice.mat', 'associative');

if (associative == 1)

%================================================Define Parameters for the Associative Memory================================

	%Check the type of training to perform in the associative memory
	training_type = 0;
	while ( (training_type ~= 1) && (training_type ~= 2) )
		training_type = input('\nSelect the desired type of training for the neural network\n1 - Hebb Rule\n2 - Pinv Method\n');
	end

	if (training_type == 1)
		%Load training data with 50 elements
		load('Pfinal.mat');
		load('Tfinal.mat');
		trainingDataInput = Pfinal;
		trainingDataOutput = Tfinal;
		
		%Set the weights' file name
		weights_file_name = 'associative_weights_Hebb.mat';
	else
		%Load training data with 50 elements
		load('PTreino500.mat');
		load('Tfinal500.mat');
		trainingDataInput = PTreino500;
		trainingDataOutput = Tfinal500;

		%Set the weights' file name
		weights_file_name = 'associative_weights_Pinv.mat';
	end

	%Save the training type
	save('AM_Training_Type.mat', 'training_type');

	%Check to see if the correspondent files exists. If not, create them
	if exist(weights_file_name, 'file') ~= 2
		%File does not exist, train the associative memory and save it

		%Train the associatvie memory
		associative_W = associativeMemory(trainingDataInput, trainingDataOutput);

		%Save the weights
		save(weights_file_name, 'associative_W');
	end
end


%=====================================================Call mpaper============================================================
mpaper();

clear;