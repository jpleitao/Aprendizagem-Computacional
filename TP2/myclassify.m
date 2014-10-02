function my_return=myclassify(data_, filled_)

	%Get the target output. Load the 'Tfinal.mat' file, containing the expected results for the input
	load('Tfinal.mat');
	Tfinal_mine = Tfinal;

	associative = 0;
	while associative ~= 1 or associative ~= 2
		associative = input('Select the desired architecture (1 - With associative memory; 2 - Without associative memory):\n');
	end

	%%Check which architecture to use (with or without associative memory)
	if (associative_ == 1)
		associativeMemory(data_, Tfinal_mine);
	end

	%Make the classification -- See how to do it with Matlab's Toolbox

end