%{
load('44202_train30.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');



load('44202_train50.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');
%}

load('44202_train70.mat');

load('trainedNetworks/net_Radial Basis Function_3.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',');

load('trainedNetworks/net_Radial Basis Function_7.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');


load('trainedNetworks/net_Radial Basis Function_15.mat');

network_results = sim(network, test_input);
network_results = convertResults(network_results);

[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

sensitivity = true_positives / (true_positives + false_negatives);
specificity = true_negatives / (true_negatives + false_positives);

M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
dlmwrite('test_results.csv',M,'delimiter',',', '-append');