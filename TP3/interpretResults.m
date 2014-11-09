%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(handles, results)

    %%%%
    %% results is a 2-by-N array with combinations of 0's and 1's
    %% Access the expected outputs in handles.test_output
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
        current_answer = handles.test_output(1:2,i);
        %current_answer = handles.training_output(1:2,i);
        
        %%Fazer aqui os expected positives e negatives
        
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
    

    %%%%
    %%  FIXME: ONCE WE HAVE THE RESULTS IN THE FORMAT (-1;0;1) PLOT THIS DATA!!! USE THE INFORMATION GIVEN
    %%%%

    %{
    %Get results and plot them
    axis(handles.axes1);
    plot(network_results, '.');
    xlim([0, size(network_results, 2)]);
    ylim([-0.1, 1.1]);
    
    %}

end