%%%%
%%	Group Classification
%%%%
load('92202_train70.mat');

groupLimitOnes = 5;
window_size = 10;

%{

%========================================================Radial Basis Function================================================================

load('trainedNetworks/Radial Basis Function/net_Radial Basis Function.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data)
dlmwrite('test_results.csv',M,'delimiter',',');

%}

%============================================================FeedForward=====================================================================

load('trainedNetworks/FeedForward/net_FeedForward_traingd_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FeedForward/net_FeedForward_trainrp_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FeedForward/net_FeedForward_trainscg_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

%=======================================================Layer Recurrent=======================================================================

load('trainedNetworks/Layer Recurrent Network/net_Layer Recurrent_traingd_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Layer Recurrent Network/net_Layer Recurrent_trainrp_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Layer Recurrent Network/net_Layer Recurrent_trainscg_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

%======================================================Distributed Time Delay==================================================================

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_traingd_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_traingd_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_traingd_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_traingd_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainrp_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainrp_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainrp_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainrp_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainscg_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainscg_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainscg_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_trainscg_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


%=======================================================FF Input Time Delay====================================================================

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_traingd_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

%fprintf('%f|%f|%f|%f|%f|%f|%f\n', specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data);
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_traingd_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_traingd_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_traingd_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainrp_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainrp_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainrp_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainrp_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainscg_hardlim_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainscg_purelin_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainscg_logsig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_trainscg_tansig_mse.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');