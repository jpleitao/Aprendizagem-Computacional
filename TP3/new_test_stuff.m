load('44202_train30.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_30.csv',M,'delimiter',',', '-append');


load('44202_train50.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_50.csv',M,'delimiter',',');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_50.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_50.csv',M,'delimiter',',', '-append');


load('44202_train70.mat');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_70.csv',M,'delimiter',',');

load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_70.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Distributed Time Delay_trainlm_mse_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results_70.csv',M,'delimiter',',', '-append');