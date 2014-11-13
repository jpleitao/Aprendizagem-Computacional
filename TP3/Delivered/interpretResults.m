%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%  This function is responsible for processing the single classification type available in our application. To perform this the function
%%  takes the network's output and the expected output and simply compares them, registering all the situations where the network performed
%%  a correct classification and also where the classification was not correct. This values are stored in the "true_positives" and
%%  "true_negatives" variables (in the cases of a correct classification) and in the "false_positives" and "false_negatives" variables (in the
%%  cases of an incorrect classification). Along side with this, the expected number of true_positives and true_negatives is also registered,
%%  based on the data available in the expected output variable ("test_results"), which would be equal to the sum of true positives and
%%  negatives, if we had a perfect classification.
%%  Because our network's classification may not be clear, due to situations where the network did not converge, the number of unclear
%%  classifications is also stored, in the "invalid_data" variable.
%%%%
function [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, results)

    %%%%
    %% results is a 2-by-N array with combinations of 0's and 1's
    %% Access the expected outputs in test_output
    %%%%
    size_results = size(results);
    number_cols_results = size_results(2);
    
    true_positives = 0;
    true_negatives = 0;
    false_positives = 0;
    false_negatives = 0;
    expected_positives = 0;
    expected_negatives = 0;
    invalid_data = 0;
    
    
    for i=1:number_cols_results
        
        current_case = results(1:2,i);
        current_answer = test_output(1:2,i);
        
        %Check if the data is invalid or not
        if (sum(current_case) == 0)
            %We have [0;0]
            invalid_data = invalid_data + 1;
            
        elseif (sum(current_case) == 2)
            %We have [1;1]
            invalid_data = invalid_data + 1;
            
        elseif (current_case(1) == 1)
            %We have [1;0] -- Non-ictal
            expected_negatives = expected_negatives + 1;            
            
        else
            %We have [0;1] -- Ictal
            expected_positives = expected_positives + 1;
        end
        
        %Here we have valid data, that is, we have [0;1] or [1;0]
        if (current_case(1) == 0 && current_case(2) == 1)%Ictal: positve
            if (current_answer(1) == 0 && current_answer(2) == 1)%True positive
                true_positives = true_positives + 1;
                
            else%False positive
                false_positives = false_positives + 1;
            end
            
        elseif (current_case(1) == 1 && current_case(2) == 0)%Non-Ictal: negative
            if (current_answer(1) == 1 && current_answer(2) == 0)%True negative
                true_negatives = true_negatives + 1;
                
            else%False negative
                false_negatives = false_negatives + 1;
            end
        end
    end
end