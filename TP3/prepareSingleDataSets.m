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
    
    %FIXME: THIS IS WRONG THE VALIDATION AND TEST INPUTS SHOULD STAY INTACT! SEE EXACTLY HOW TO CREATE THOSE SETS
    [test_input, test_output] = getTestDataSingle(crysis_indexes, Trg, FeatVectSel, handles.percentage_test);

end