%%%%
%%
%%	João Tiago Márcia do Nascimento Fernandes 	2011162899
%%	Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%	This function "trains" the associative memory for a given input, and corresponding expected output. This associative memory consists
%%	of a single layer neural network, with linear activation function, and with no bias. The "train" of the network consists in determining
%%	its weights, which is done in this way:
%%		- Using the pinv of the input data: W = output x pinv(input)
%%
%%	This function returns the computed weights, wich are later "applied" to the input data, computing "W x data", to obtain the
%%	"more corrected" version of the input.
%%%%
function associative_W = associativeMemory(my_data, my_target, transpose)
	
	if (transpose == 1)
		associative_W = my_target * my_data';
	else
		associative_W = my_target * pinv(my_data);
	end
end