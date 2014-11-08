%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [training_input, training_output, test_input, test_output] = prepareDataSets(handles)

	%Load training file
	load(handles.training_file);

	%Get indexes of the patient's crysis
	crysis_indexes = getCrysisIndexes(Trg);

	%Get train and test data
	[training_input, training_output] = getPercentageData(crysis_indexes, Trg, FeatVectSel, handles.percentage_training);

	number_crysis = size(crysis_indexes);
	number_crysis = number_crysis(1);

	start_test = round(number_crysis * (handles.percentage_training/100));
    start_test = crysis_indexes(start_test) + 1;
	test_input = FeatVectSel(start_test:end,:);
	test_input = test_input';

	test_output = Trg(start_test:end,:);
	test_output = test_output';

	%%%%
	%% Prepare the outputs to take in account the fact that we have two neurons in the output layer
	%%%%
	temp_train = [];
	temp_test = [];
	
	for i=1:length(training_output)
		if (training_output(1,i) == 0)%Non-ictal
			temp_train(:,i) = [1;0];
		else%training_output(1,i) == 1 -- Ictal
			temp_train(:,i) = [0;1];
		end
	end

	for i=1:length(test_output)
		if (test_output(1,i) == 0)%Non-ictal
			temp_test(:,i) = [1;0];
		else%test_output(1,i) == 1 -- Ictal
			temp_test(:,i) = [0;1];
		end
	end

	training_output = temp_train;
	test_output = temp_test;
end