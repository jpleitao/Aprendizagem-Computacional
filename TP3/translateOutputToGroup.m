%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function groupedOutput = translateOutputToGroup(output, groupLimitOnes, window_size)

    groupedOutput = [];
    
    %{
        numberOnes = sum(output(i:i+window_size-1) == 1);
        groupedOutput(i) = numberOnes >= groupLimitOnes;
    %}
    
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