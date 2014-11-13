load('63502_train30.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('63502_train50.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('63502_train70.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


%{
load('44202_train30.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('44202_train50.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('44202_train70.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%========================================================================================================================================
%========================================================================================================================================
%========================================================================================================================================

load('63502_train30.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('63502_train50.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('63502_train70.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


%==========================================================================================================================================

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_tansig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_logsig_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');

%}