%%%%
%% Script to run the application using the Hebb rule in the associative memory
%%%%

%{
load('PerfectArial.mat');
current_iteration = 0;
Tfinal500 = [];
while current_iteration < 500
	current_position_T = mod(current_iteration,10);
	if (current_position_T == 0)
		current_position_T = 10;
	end

	Tfinal500 = [Tfinal500, Perfect(:, current_position_T)];
	current_iteration = current_iteration + 1;
end

clear Perfect
clear current_position_T
clear current_iteration
save Tfinal500	
%}