%%%%
%%	TODO: DOCUMENT THIS! WE JUST RETURN THE WEIGHTS AND LATER PERFORM THE PRODUCT
%%
%%	The associative memory consists of a single layer neural network, with linear activation function, and with no bias. To obtain the
%%	weights of this neural network we simply compute one of the following products:
%%		- desired target x pinv(data), if there are more prototypes than entries
%%		- desired target x data^T *(data * data^T)^-1, if there are more entries than prototypes
%%
%%%%
function associative_W = associativeMemory(my_data, my_target)

	[num_rows, num_cols] = size(my_data);
	
	if (num_rows < num_cols)%More prototypes than entries
		%Hebb rule
		associative_W = my_target * my_data' * inv(my_data * my_data');
	else%More entries than prototypes (or the same)
		%Pseudo Inverse
		associative_W = my_target * pinv(my_data);
	end

	
end