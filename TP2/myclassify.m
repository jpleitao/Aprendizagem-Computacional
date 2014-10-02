function my_return=myclassify(data_, filled_)

	%Get the target output. Load the 'P50.mat' file, containing the first 50

	associative = 0;
	while associative ~= 1 or associative ~= 2
		associative = input('Select the desired architecture (1 - With associative memory; 2 - Without associative memory):\n');
	end

	%%Check which architecture to use (with or without associative memory)
	if (associative_ == 1)
		associativeMemory(data_, );
	end

end