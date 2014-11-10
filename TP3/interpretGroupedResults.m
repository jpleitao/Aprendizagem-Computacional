%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_results, results)
    
    true_positives = 0;
    true_negatives = 0;
    false_positives = 0;
    false_negatives = 0;
    expected_positives = 0;
    expected_negatives = 0;
    invalid_data = 0;
    
    for i=1:length(expected_results)
        if (expected_results(i) == 1)
           expected_positives = expected_positives + 1;
        else
            expected_negatives = expected_negatives + 1;
        end
    end

    for i=1:length(expected_results)
        if (results(i) == 1)%Ictal
            if (expected_results(i) == 1)%Ictal -- True positive
                true_positives = true_positives + 1;
            else%expected_results(i) == 0 --> Non-ictal --> False positive
                false_positives = false_positives + 1;
            end
        
        elseif (results(i) == 0)%Non-Ictal
            if (expected_results(i) == 1)%Ictal -- False negative
                false_negatives = false_negatives + 1;
            else%expected_results(i) == 0 --> Non-ictal --> True negative
                true_negatives = true_negatives + 1;
            end
        
        else%results(i) == -1 -->Invalid
            invalid_data = invalid_data + 1;
        end
        
    end
end