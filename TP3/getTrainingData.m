%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [training_input, training_output] = getTrainingData(crysis_indexes, Target, Input, percentage_training)

	[training_input, training_output] = getPercentageData(crysis_indexes, Target, Input, percentage_training);
end