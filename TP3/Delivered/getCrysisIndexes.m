%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%	Analysis a given target matrix, composed of sequences of 0's and 1's, and returns the starting and ending indexes of the sequences of 1's
%%	in that matrix. In our application, this matrix is one of the original data set's target matrix, containing the classifications of the
%%	correspondent patient's state. It takes the value 0 in moments where the patient's collected characteristics correspond to an epileptic
%%	crysis, and 1 where the patient's collected characteristics correspond to an epileptic crysis.
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
		
		last = tempOne+last+tempTwo;
		cont = cont + 1;
	end
end
