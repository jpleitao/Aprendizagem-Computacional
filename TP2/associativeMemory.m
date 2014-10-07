%%%%
%%	my_data --> Data we want to apply the associative memory to
%%	my_target --> Target data, with the expected output for the given input
%%	Returns the "corrected" input, stored in P2
%%	When using associative memory the user has to fill all the squares, in the following order: 1;2;3;4;5;6;7;8;9;0
%%
%%	The associative memory consists of a single layer neural network, with linear activation function, and with no bias. To obtain the
%%	weights of this neural network we simply compute the following product: desired target x pinv(data) or desired target x data^T
%%	COMMENT
%%
%%%%
function P2 = associativeMemory(my_data, my_target)

	[num_rows, num_cols] = size(my_data);
	
	
	if (num_rows < num_cols)%More prototypes than entries (or same number)
		%Hebb rule
		W = my_target * my_data'/(my_data * my_data');
	else%More entries than prototypes -- Use pinv
		%Pseudo Inverse
		W = my_target * pinv(my_data);
	end

	P2 = W * my_data;
end