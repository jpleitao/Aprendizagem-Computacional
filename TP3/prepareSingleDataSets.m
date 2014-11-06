%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [training_input, training_output, test_input, test_output] = prepareSingleDataSets(handles)

	%Load training file
	load(handles.training_file);

	%Get indexes of the patient's crysis
	crysis_indexes = getCrysisIndexes(Trg);

	%Get train and test data
	[training_input, training_output] = getTrainingDataSingle(crysis_indexes, Trg, FeatVectSel, handles.percentage_training);

	number_crysis = size(crysis_indexes);
	number_crysis = number_crysis(1);

	start_training = round(number_crysis * (handles.percentage_training/100));
	test_input = FeatVectSel(start_training:end,:);
	test_input = test_input';

	test_output = Trg(start_training:end,:);
	test_output = test_output';
end