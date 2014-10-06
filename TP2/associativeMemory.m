%%%%
%%	my_data --> Data we want to apply the associative memory to
%%	my_target --> Target data, with the expected output for the given input
%%	Returns the "corrected" input, stored in P2
%%	When using associative memory the user has to fill all the squares, in the following order: 1;2;3;4;5;6;7;8;9;0
%%
%%	How does the Associative Memory works? TODO: EXPLAIN
%%	FIXME: Is this going to be implemented as a neural network?
%%
%%%%
function P2 = associativeMemory(my_data, my_target)

	my_method = 0;
	while ((my_method ~= 1) && (my_method ~= 2))
		%Ask for the method to be applied(Pseudo-inverse or Hubb)
		my_method = input('Select the desired method to apply in the Associative Memory.\n1 - Pseudo-inverse method\n2 - Hubb method\n');
	end

	[num_rows, num_cols] = size(my_target);
	P2 = zeros(num_rows, num_cols);
	
	if (my_method == 1)
		%Pseudo Inverse
		W = my_target * pinv(my_data);
	else
		%Hubb rule
		W = my_target * my_data';
	end

	P2 = W * my_data;
end