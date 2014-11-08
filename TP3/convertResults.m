%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
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