%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [test_input, test_output] = getTestData(crysis_indexes, Target, Input, percentage_testing)

	[test_input, test_output] = getPercentageData(crysis_indexes, Target, Input, percentage_training);
end