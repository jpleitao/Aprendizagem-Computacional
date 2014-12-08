%%%%
%%
%%	João Tiago Márcia do Nascimento Fernandes 	2011162899
%%	Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%% Script to run the application
%%%%

%==============================================Get the Reference Function=====================================================================
reference = 0;
while ( (reference ~= 1) && (reference ~= 2))
	reference = input('Select the desired reference function\n1 - Square\n2 - Sin\n');
end

%================================================Get the Controller Type======================================================================
controller_type = 0;
while ( (controller_type ~= 1) && (controller_type ~= 2) )
	controller_type = input('Select the desired controller type:\n1 - Mamdani\n2 - Sugeno\n');
end

%=============================================Get the number of rules of the controller=======================================================
number_rules = 0;
while ( (number_rules ~= 1) && (number_rules ~= 2))
	number_rules = input('Select the desired number of rules for the controller:\n1 - 9 rules\n2 - 25 rules\n');
end

%=================================================Get the Perturbation Type===================================================================
perturbation = 0;
while ( (perturbation ~= 1) && (perturbation ~= 2) && (perturbation ~= 3) && (perturbation ~= 4))
	perturbation = input('Select the desired perturbation type:\n1 - No perturbation\n2 - Perturbation in the actuator\n3 - Perturbation in the charge\n4 - Perturbation in the actuator and in the charge\n');
end

%==================================================Load Everything============================================================================

model_name = 'Models/model_';

if (controller_type == 1)
	%Mamdani
	model_name = strcat(model_name, 'mamdani_');

	if (number_rules == 1)
		%9 Rules
		model_name = strcat(model_name, '9_');
		mamdani_9 = readfis('Controllers/mamdani_9.fis');
	else
		%25 Rules
		model_name = strcat(model_name, '25_');
		mamdani_25 = readfis('Controllers/mamdani_25.fis');
	end
else
	%Sugeno
	model_name = strcat(model_name, 'sugeno_');

	if (number_rules == 1)
		%9 Rules
		model_name = strcat(model_name, '9_');
		mamdani_9 = readfis('Controllers/mamdani_9.fis');
	else
		%25 Rules
		model_name = strcat(model_name, '25_');
		mamdani_25 = readfis('Controllers/mamdani_25.fis');
	end
end

if (reference == 1)
	%Square as the reference function
	model_name = strcat(model_name, 'square');
else
	%Sin as the reference function
	model_name = strcat(model_name, 'sin');
end

if (perturbation == 2)
	%Perturbation in the actuator
	model_name = strcat(model_name, '_actuator');
elseif (perturbation == 3)
	%Perturbation in the charge
	model_name = strcat(model_name, '_charge');
elseif (perturbation == 4)
	%Perturbation in the actuator and in the charge
	model_name = strcat(model_name, '_actuator_charge');
end

model_name = strcat(model_name, '.slx');

%Open Model
uiopen(model_name, 1);