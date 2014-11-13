training_file = '92202.mat';
output_training_file = '92202_train70.mat';
percentage_training = 70;

handles = struct('percentage_training', percentage_training, 'training_file', training_file);

[training_input, training_output, test_input, test_output] = prepareDataSets(handles);

save(output_training_file, 'test_input', 'test_output');

%{
training_file = '44202.mat';
output_training_file = '44202_train50.mat';
percentage_training = 50;

handles = struct('percentage_training', percentage_training, 'training_file', training_file);

[training_input, training_output, test_input, test_output] = prepareDataSets(handles);

save(output_training_file, 'test_input', 'test_output');


training_file = '63502.mat';
output_training_file = '63502_train50.mat';
percentage_training = 50;

handles = struct('percentage_training', percentage_training, 'training_file', training_file);

[training_input, training_output, test_input, test_output] = prepareDataSets(handles);

save(output_training_file, 'test_input', 'test_output');

%}