%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%  This functions takes the results of the execution of a given neural network, which is a 2-by-N array of float values, correponding to the
%%  neural network's output.
%%  The results of the classifications of our networks have to be one of two values:
%%      - Ictal, represented by the array [0;1]
%%      - Non-ictal, represented by the array [1;0]
%%  So, to support this requirement, in this function we convert the network's output, which can be something like [0.5; 1.1], to the
%%  required binary values, 0 or 1. This can be accomplish simply by setting to 1all values equal or higher to 0.5, and all the others to 0.
%%%%
function results = convertResults(results)
    
    %%%%
    %%  results is a 2-by-N array. In each collumn of the array we have two possible values, that can be like [0.5, -2.2], etc.
    %%  We need to convert them to 0's or 1's, and only those two values!
    %%%%
    size_results = size(results);
    number_cols = size_results(2);
    for i=1:number_cols
        if (results(1,i)>=0.5)
            results(1,i) = 1;
        else
            results(1,i) = 0;
        end
            
        if (results(2,i)>=0.5)
            results(2,i) = 1;
        else
            results(2,i) = 0;
        end
    end
end