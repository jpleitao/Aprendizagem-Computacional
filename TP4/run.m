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

%=============================================Get the membership function of the controller===================================================
membership_function = 0;
while ( (membership_function ~= 1) && (membership_function ~= 2) )
	membership_function = input('Select the desired membership function for the controller:\n1 - Gaussmf\n2 - Trimf\n');
end

%===========================================Get the defuzzification method of the controller==================================================
defuzzification_method = 0;
while ( (defuzzification_method ~= 1) && (defuzzification_method ~= 2) )
	if (controller_type == 1)
		%Mamdani
		defuzzification_method = input('Select the desired defuzzification method:\n1 - Centroid\n2 - Medmax\n');
	else
		%Sugeno
		defuzzification_method = input('Select the desired defuzzification method:\n1 - Med\n2 - Sum\n');
	end
end

%=================================================Get the Perturbation Type===================================================================
perturbation = 0;
while ( (perturbation ~= 1) && (perturbation ~= 2) && (perturbation ~= 3) && (perturbation ~= 4))
	perturbation = input('Select the desired perturbation type:\n1 - No perturbation\n2 - Perturbation in the actuator\n3 - Perturbation in the charge\n4 - Perturbation in the actuator and in the charge\n');
end

%==================================================Load Everything============================================================================

model_name = 'Models/model_';
controller_name = 'Controllers/'

if (controller_type == 1)
	%Mamdani
	model_name = strcat(model_name, 'mamdani_');
	controller_name = strcat(controller_name, 'mamdani_');

	if (number_rules == 1)
		%9 Rules
		model_name = strcat(model_name, '9_');
		controller_name = strcat(controller_name, '9_');
	else
		%25 Rules
		model_name = strcat(model_name, '25_');
		controller_name = strcat(controller_name, '25_');
	end

	if (membership_function == 1)
		%Gaussmf
		controller_name = strcat(controller_name, 'gaussmf_');
	else
		%Trimf
		controller_name = strcat(controller_name, 'trimf_');
	end

	if (defuzzification_method == 1)
		%Centroid
		controller_name = strcat(controller_name, 'centroid.fis');
	else
		%Medmax
		controller_name = strcat(controller_name, 'medmax.fis');
	end

else
	%Sugeno
	model_name = strcat(model_name, 'sugeno_');
	controller_name = strcat(controller_name, 'sugeno_');

	if (number_rules == 1)
		%9 Rules
		model_name = strcat(model_name, '9_');
		controller_name = strcat(controller_name, '9_');
	else
		%25 Rules
		model_name = strcat(model_name, '25_');
		controller_name = strcat(controller_name, '25_');
	end

	if (membership_function == 1)
		%Gaussmf
		controller_name = strcat(controller_name, 'gaussmf_');
	else
		%Trimf
		controller_name = strcat(controller_name, 'trimf_');
	end

	if (defuzzification_method == 1)
		%Centroid
		controller_name = strcat(controller_name, 'med.fis');
	else
		%Medmax
		controller_name = strcat(controller_name, 'sum.fis');
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

%Load Controller
if (number_rules == 1)
	mamdani_9 = readfis(controller_name);
else
	mamdani_25 = readfis(controller_name);
end

%Open Model
uiopen(model_name, 1);