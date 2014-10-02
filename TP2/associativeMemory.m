%%%%
%% my_data --> Data we want to apply the associative memory to
%% my_target --> Target data, with the expected output for the given input
%% Returns the "corrected" input
%%%%
function P2 = associativeMemory(my_data, my_target)

	my_method = 0;
	while my_method ~= 1 or my_method ~= 2
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

	P2 = W * my_data;

end