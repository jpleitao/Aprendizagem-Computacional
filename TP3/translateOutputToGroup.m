%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%  This functions takes the neural network's filtered output, or the target output for a given test case, applies our group classification
%%  approach. Our group classification approach consists simply in considering groups of data of a fixed size (defined in the "window_size"
%%  variable) and counting the number of ictal classifications present in that group (ictal classifications are classifications equal to
%%  [0;1]). If that number is equal or higher to a given threshold, then we consider the classification of that group to correspond to an
%%  ictal situation, and is marked with the value "1". Otherwise, we consider a non-ictal situation, and is marked with the value "0".
%%  Because we may not have a perfect classification, we have also included the detection of invalid classifications: Remember that we only
%%  have two possible classifications: [0;1] for ictal situations and [1;0] for non-ictal situations. Any other classification different from
%%  that, like [0;0] or [1;1], are considered invalid, and marked with the value "-1".
%%%%
function groupedOutput = translateOutputToGroup(output, groupLimitOnes, window_size)

    groupedOutput = [];
    
    size_output = size(output);
    number_cols = size_output(2);
    
    for i=1:number_cols - window_size
        
        %Check if current window has at least one valid value
        numberInvalids = length(find(output(1,i:i + window_size - 1) == 0 & output(2,i:i + window_size - 1) == 0));
        numberInvalids = numberInvalids + length(find(output(1,i:i + window_size - 1) == 1 & output(2,i:i + window_size - 1) == 1));
        
        %All the values are invalid, so the correspondent result is invalid
        if (numberInvalids == window_size)
            groupedOutput(i) = -1;
        
        else
            numberOnes = length(find(output(1,i:i + window_size - 1) == 0 & output(2,i:i + window_size - 1) == 1));
            groupedOutput(i) = numberOnes >= groupLimitOnes;
        end
    end
end