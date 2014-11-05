%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [training_input, training_output, test_input, test_output] = getTrainingAndTestingData(crysis_indexes, Target, Input, percentage_training)

	%randperm
	%divideind

	%crysis_indexes -> [Start_crysis, End_crysis]
	number_crysis = size(crysis_indexes);
	number_crysis = number_crysis(1) * 2;

%=======================================================Training Data=========================================================================

	%%FIXME: PEDIR AO UTILIZADOR A PERCENTAGEM DE CRISES NOS DADOS DE TESTE E FAZER A CRIAÇAO DESSES DADOS DE TESTE A PARTE, EM VEZ DE SER NO
	%%MESMO SITIO QUE OS DE TREINO	

%=========================================================Test Data===========================================================================
	

	training_input = [];
	training_output = [];
	test_input = [];
	test_output = [];
end