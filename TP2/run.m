%%%%
%%
%%	João Tiago Márcia do Nascimento Fernandes 	2011162899
%%	Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%% Script to run the application
%%%%

%================================================Check for Associative Memory=================================================================
%Ask the user if using associative memory or not
associative = 0;
while ( (associative ~= 1) && (associative ~= 2))
	associative = input('Select the desired architecture\n1 - With associative memory\n2 - Without associative memory\n');
end

%Save the user's choice
save('user_associative_choice.mat', 'associative');

%================================================Define Parameters for the Associative Memory=================================================

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

if (associative == 1)

	if (training_dimension == 1)
		%Load training data with 500 elements
		load('PTreino500.mat');
		load('Tfinal500.mat');
		
		trainingDataInput = PTreino;
		trainingDataOutput = Tfinal;
		
	else
		%Load training data with 100 elements
		load('PTreino100.mat');
		load('Tfinal100.mat');
		trainingDataInput = PTreino;
		trainingDataOutput = Tfinal;
	end

	%Check the type of training to perform in the associative memory
	training_type = 0;
	while ( (training_type ~= 1) && (training_type ~= 2))
		training_type = input('\nSelect the desired training method\n1 - Transpose\n2 - Pinv\n');
	end

	if (training_type == 1)
		%Set the weights' file name
		weights_file_name = 'associative_weights_Transpose.mat';
	else	
		%Set the weights' file name
		weights_file_name = 'associative_weights_Pinv.mat';
	end

	%Save the training type
	save('AM_Training_Type.mat', 'training_type');

	%Check to see if the correspondent files exists. If not, create them
	if exist(weights_file_name, 'file') ~= 2
		%File does not exist, train the associative memory and save it

		%Train the associatvie memory
		associative_W = associativeMemory(trainingDataInput, trainingDataOutput, training_type);

		%Save the weights
		save(weights_file_name, 'associative_W');
	end
end


%=====================================================Call mpaper=============================================================================
mpaper();

clear;