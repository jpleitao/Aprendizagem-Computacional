%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function cr = getCrysisIndexes(Trg)

	cr = [];
	aux = Trg;

	last = 0;
	cont = 1;

	tempOne = 1;

	while(~isempty(tempOne))
		%Find first crysis
		tempOne = find(aux == 1, 1, 'first');%find(X,K,'first') is the same as find(X,K)
		
		if(isempty(tempOne))
			break;
		end

		aux = Trg((tempOne+last+1): length(Trg));

		tempTwo = find(aux == 0, 1, 'first');
		cr(cont, 1) = tempOne+last;
		
		cr(cont, 2) = tempOne+last+tempTwo;
		aux = Trg((tempOne+last+tempTwo+1): length(Trg));

		%So, in "cr" we are saving all the indexes of each epileptic crysis in Trg, and for each crysis we store the start and end, right?

		%Why do we need the "last" variable?
		
		last = tempOne+last+tempTwo;
		cont = cont + 1;
	end
end
