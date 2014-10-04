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
		my_method = input('Select the desired method to apply in the Associative Memory.\n1 - Pseudo-inverse method\n2 - Hubb method\n');
	end

	[num_rows, num_cols] = size(my_target);
	P2 = zeros(num_rows, num_cols);
	
	if (my_method == 1)
		%Pseudo Inverse
		i = 1;
		while (i<=num_cols)
			W = my_target(:,i) * pinv(my_data(:,i));
			P2(:,i) = W * my_data(:,i);
			i = i + 1;
		end
	else
		%Hubb rule
		i = 1;
		while (i<=num_cols)
			temp = my_data(:,i);
			W = my_target(:,i) * temp';
			P2(:,i) = W * my_data(:,i);
			i = i + 1;
		end
	end

	%{
	%Use neural network
	rows = size(my_data,1);
	weights = size(W,1);
	b = zeros(weights,1);
	
	%Create perceptron
	associative_memory_network = newff(ones(rows,1)*[0 1], rows, {'purelin'});%Should use newp!!!!
	associative_memory_network.IW{1, :} = W;
	associative_memory_network.b{1} = b;	

	%Run it to obtain the "corrected" data
	P2 = sim(associative_memory_network, my_data);
	%}

end