%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%  Analysis the correlation of the different characteristics provided in the input data set, and selects the characteristics with higher correlation values
%%  to be be considered in the "new" input data set.
%%  With this feature selection we eliminate redundant characteristics from the train and test cases, improving the networks' training time without losing
%%  performance.
%%  The approach considered in this method is the following:
%%      1- Analyse the correlation of each characteristic with the result with the function "corrcoef"
%%      2- Select the characteristics with higher correlation values, in the same number as specified by the user
%%%%
function reduced_input = processCharacteristics(inputData, targetData, number_characteristics)

    result = horzcat(FeatVectSel, Trg);
    [r, p] = corrcoef(result);

    %Here we want to analyse the correlation values from the 30-th collumn of the matrix, which relates the output with all the input characteristics    
    correlations = r(30, 1:29);
    %Because we can have negative values, apply the absolute value
    correlations = abs(correlations);

    %Sort them and select the required number
    [correlations_sorted, indexes] = sort(correlations, 'descend');
    reduced_input = FeatVectSel(:, indexes(1:3));
end