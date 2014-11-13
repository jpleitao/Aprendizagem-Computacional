%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%	This function gets the indexes of the crysis in the given Input matrix, and selects the first X crysis of that matrix, where X is a
%%	percentage of the total number of crysis, defined in the "percentage" variable.
%%	The selected crysis will be added to the "data_input" variable, and their correspondent values in the "Target" matrix will also be
%%	added in the same positions in the "data_output" variable.
%%	This function also adds the same number of non-ictal situations as the number of ictal situations added, preserving their relative
%%	position in the original data set. Because the number of ictal situations is far smaller than the number of non-ictal situations
%%	the non-ictal situations are randomly selected, but always preserving the relative position of both selected ictal and non-ictal
%%	situations. To illustrate our point, let's consider the following example:
%%	If we have the situations A and B, where A corresponds to a non-ictal situation and occurs before B, which corresponds to a non-ictal
%%	situation, in the original data set. If both A and B are included in the final data set, then A will be placed in this data set before B. 
%%%%
function [data_input, data_output] = getPercentageData(crysis_indexes, Target, Input, percentage)

	%%%%
	%% Our input will be a matrix of dimensions 29xY, where Y is the number of input data
	%% Our output will be a matrix of dimensions 2xY, where Y is the number of input data
	%%%%

	Target = Target';

	%crysis_indexes -> [Start_crysis, End_crysis]
	number_crysis = size(crysis_indexes);
	number_crysis = number_crysis(1);

	number_non_ictal_inserted = 0;
	missing_non_ictal_inserted = 0;
	number_ictal_inserted = 0;

	data_input = [];
	data_output = [];

%=======================================================Training Data=========================================================================

	number_crysis_training = number_crysis * (percentage/100);

	i=1;
	begin = 1;
	while (i <= number_crysis_training)

		current_ictal_elements = crysis_indexes(i,2) - crysis_indexes(i,1);%crysis_indexes(i,2) has the index of the first 0

		%Add to that number the number of missing elements
		current_number_elements = current_ictal_elements + missing_non_ictal_inserted;

		%Go and try to get the same number of elements as the current crysis' number of elements in the indexes before the current crysis
		non_ictal_positions = begin:crysis_indexes(i,1)-1;
		number_non_ictal_elements = length(non_ictal_positions);

		%Check if we can add all of them
		if (number_non_ictal_elements >= current_number_elements)

			%Select those positions randomly and add them to the training input and output
			selected_non_ictal_positions = randperm(number_non_ictal_elements, current_number_elements);
			data_input = [data_input, Input(selected_non_ictal_positions,:)'];
			data_output = [data_output, Target(selected_non_ictal_positions)];
			number_non_ictal_inserted = number_non_ictal_inserted + current_number_elements;
			missing_non_ictal_inserted = 0;

		else
			%Just add as much as we can and mark the missing number of elements
			data_input = [data_input, Input(non_ictal_positions,:)'];
			data_output = [data_output, Target(non_ictal_positions)];
			number_non_ictal_inserted = number_non_ictal_inserted + number_non_ictal_elements;
			missing_non_ictal_inserted = current_number_elements - number_non_ictal_elements;
		end

		%Add the current ictal elements
		data_input = [data_input, Input(crysis_indexes(i,1):crysis_indexes(i,2)-1, :)'];
		data_output = [data_output, Target(crysis_indexes(i,1):crysis_indexes(i,2)-1)];
		number_ictal_inserted = number_ictal_inserted + current_ictal_elements;

		begin = crysis_indexes(i,2);
		i = i + 1;
	end

	%If we still are missing elements, them add them here. We have to insert non-ictal elements
	if (number_ictal_inserted > number_non_ictal_inserted)
		to_insert = number_ictal_inserted - number_non_ictal_inserted;
		begin = crysis_indexes(number_crysis, 2);

		number_elements_target = length(Target);
		
		%Get remaining positions
		temp = find(Target == 0);
		non_ictal_positions = temp(find(temp >= begin));
		number_non_ictal_elements = length(non_ictal_positions);

		%Randomly select some of them and add them to the data_input and output arrays
		selected_non_ictal_positions = randperm(number_non_ictal_elements, to_insert);
		data_input = [data_input, Input(non_ictal_positions(selected_non_ictal_positions))];
		data_output = [data_output, Target(non_ictal_positions(selected_non_ictal_positions))];
	end

end