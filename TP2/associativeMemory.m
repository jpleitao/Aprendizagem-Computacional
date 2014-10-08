%%%%
%%	This function "trains" the associative memory for a given input, and corresponding expected output. This associative memory consists
%%	of a single layer neural network, with linear activation function, and with no bias. The "train" of the network consists in determining
%%	its weights, which is done in one of two ways:
%%		- If there are more prototypes than entries to our network, then the weights are computed as follows: 
%%										W = output x input^T x (input x input^T)^-1
%%		- Otherwise, the weights are computed as follows:
%%										W = output x pinv(input)
%%
%%	This function returns the computed weights, wich are later "applied" to the input data, computing "W x data", to obtain the
%%	"more corrected" version of the input.
%%%%
function associative_W = associativeMemory(my_data, my_target)

	[num_rows, num_cols] = size(my_data);
	
	if (num_rows < num_cols)
		inv(my_data * my_data')
		num_rows
		num_cols
		pause;
		%More prototypes than entries --  Use the Hebb Rule
		associative_W = my_target * my_data' * inv(my_data * my_data');
	else
		%More entries than prototypes (or the same) -- Use the Pseudo Inverse
		associative_W = my_target * pinv(my_data);
	end
end