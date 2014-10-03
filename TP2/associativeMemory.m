%%%%
%%	my_data --> Data we want to apply the associative memory to
%%	my_target --> Target data, with the expected output for the given input
%%	Returns the "corrected" input, stored in P2
%%	When using associative memory the user has to fill all the squares, in the following order: 1;2;3;4;5;6;7;8;9;0
%%
%%	How does the Associative Memory works? TODO: EXPLAIN
%%
%%%%
function P2 = associativeMemory(my_data, my_target)

	my_method = 0;
	while ((my_method ~= 1) && (my_method ~= 2))
		%Ask for the method to be applied(Pseudo-inverse or Hubb)
		my_method = input('For the pseudo-inverse method select 1. For the Hubb method select 2\n');
	end
	
	if (my_method == 1)
		%Pseudo Inverse
		W = my_target * pinv(my_data);
	else
		%Hubb rule
		W = my_target * my_data';
	end

	rows = size(my_data,1);
	weights = size(W,1);
	b = zeros(weights,1);

	%Create perceptron
	associative_memory_network = newff(ones(rows,1)*[0 1], rows, {'purelin'});
	associative_memory_network.IW{1, :} = W;
	associative_memory_network.b{1} = b;	

	%Run it to obtain the "corrected" data
	%P2 = sim(associative_memory_network, my_data);

	%FIXME: Make sim work!!!

	P2 = W * my_data;%THIS IS WRONG!!!

end