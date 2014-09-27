%%%%
%%	Script for generating pairs "test-solution", used to train our artificial neural network.
%%	The approach followed is the following: Draw, with "mpaper", numbers from 0 to 9 in every row, IN THE FOLLOWING ORDER:
%%	1; 2; 3; 4; 5; 6; 7; 8; 9; 0 (the order can be changed)
%%	Then, generate a random position for each of these numbers, which will define their order in the given iteration, in the P array.
%%	With this order we can add the matching values in the T array.
%%%%

load('PerfectArial.mat');
cond = 1;
Pfinal = [];
Tfinal = [];
drawing_order = [1:9,0];

while cond < 11%Since cond starts in 1 and we want to make 500 iterations we need to run the cycle while cond<=10, that is while cond<11
	% Open mpaper %
	mpaper;
	
	% This wait for the Figure 1 - mpaper - to close %
	waitfor(1);

	load('P.mat');

	% Read the P array, to get the elements drawn, and sort their order
	current_iteration = 0;

	while current_iteration < 5%We have 5 rows
		
		current_iteration2 = 0;
		available_positions = [1:10];%All the possible positions for each row

		while current_iteration2 < 10

			%Generate random position from the array of available positions -- That value in P will be the selected one
			random_position = randi(length(available_positions), 1);
			current_position = available_positions(random_position);%Get available position
			available_positions = available_positions(available_positions ~= current_position);%Remove it from the array

			%Get that position from the P and T arrays
			current_element_P = P(:, (current_iteration * 10) + current_position);

			current_position_T = mod(current_position,10);
			if (current_position_T == 0)
				current_position_T = 10;
			end
			current_element_T = Perfect(:, current_position_T);

			%Now we have the P element, and the corresponding T element, so let's insert them in the final P:
			Pfinal = [Pfinal, current_element_P];
			Tfinal = [Tfinal, current_element_T];

			current_iteration2 = current_iteration2 + 1;
		end

		current_iteration = current_iteration + 1;
	end

	% Increase cond
	cond = cond + 1;
end

showim(Pfinal);
pause
showim(Tfinal);