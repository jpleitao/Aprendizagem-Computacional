%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%% Script to run the application
%%%%

%==============================================Ask for file to train the network==============================================================

training_file = -1;
while ( (training_file ~= 1) & (training_file ~= 2) )
	training_file = input('Escolha ficheiro para treinar a rede\n1- 44202.mat\n2- 63502.mat\n> ');
end

if(training_file == 1) 
	load('44202.mat');
else
	load('63502.mat');
end

%===================================Get percentage crysis for training and testing============================================================
percentage_training = -1;
while ( (percentage_training < 0) || (percentage_training > 100) )
	percentage_training = input('\nInsert the desired percentage of crysis to include in the training data set\n(Suggested: 70): ');
end

%==============================================Get the crysis indexes=========================================================================

%Get the indexes of the patient's crysis
crysis_indexes = getCrysisIndexes(Trg);

%==============================================Get Train and Test Data========================================================================

[training_input, training_output, test_input, test_output] = getTrainingAndTestingData(crysis_indexes, Trg, FeatVectSel, percentage_training);