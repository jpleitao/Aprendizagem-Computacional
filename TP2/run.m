%%%%
%% Script to run the application using the Hebb rule in the associative memory -- Prompt the user to use big training data (Hebb rule) or small training data (pinv)
%%%%

%================================================Check for Associative Memory===============================================
%Ask the user if using associative memory or not
associative = 0;
while ( (associative ~= 1) && (associative ~= 2))
	associative = input('\nSelect the desired architecture\n1 - With associative memory\n2 - Without associative memory\n');
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
	else
		%Load training data with 50 elements
		load('PTreino500.mat');
		load('Tfinal500.mat');
		trainingDataInput = PTreino500;
		trainingDataOutput = Tfinal500;
	end

	%Train the associatvie memory
	associative_W = associativeMemory(trainingDataInput, trainingDataOutput);

	%Save the weights
	save('associative_weights.mat', 'associative_W');
end


%=====================================================Call mpaper============================================================
mpaper();

%{
load('PerfectArial.mat');
current_iteration = 0;
Tfinal500 = [];
while current_iteration < 500
	current_position_T = mod(current_iteration,10);
	if (current_position_T == 0)
		current_position_T = 10;
	end

	Tfinal500 = [Tfinal500, Perfect(:, current_position_T)];
	current_iteration = current_iteration + 1;
end

clear Perfect
clear current_position_T
clear current_iteration
save Tfinal500	
%}