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

% Open mpaper %
mpaper;

% This wait for the Figure 1 - mpaper - to close %
waitfor(1);

load('P.mat');

% Read the P array, to get the elements drawn, and sort their order
current_iteration = 0;

while current_iteration < 50%We have 50 elements

	%Get position in PerfectArial
	current_position_T = mod(current_iteration,10);
	if (current_position_T == 0)
		current_position_T = 10;
	end

	Pfinal = [Pfinal, P(:,current_iteration)];
	Tfinal = [Tfinal, Perfect(:, current_position_T)];

	current_iteration = current_iteration + 1;
end

save Pfinal;
save Tfinal;