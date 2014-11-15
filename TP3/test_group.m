%%%%
%%	Group Classification
%%%%
load('44202_reduced_5_train50.mat');

groupLimitOnes = 5;
window_size = 10;

activationsFunctions1 = {'hardlim', 'purelin', 'logsig', 'tansig'};
trainFunctions1 = {'trainlm', 'traingd', 'trainrp'};
hiddenLayersSizes = [3, ceil(log2(29)), 29];

firstTime = 1;

%========================================================Radial Basis Function=================================================================

networkName = 'trainedNetworks/Radial Basis Function/net_Radial Basis Function_';

for i=1:length(hiddenLayersSizes)

	networkName_temp = strcat(networkName, num2str(hiddenLayersSizes(i)), '.mat');

	load(networkName_temp);

	network_results = sim(network, test_input);
	network_results = convertResults(network_results);

	expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
	got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

	[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

	sensitivity = true_positives / (true_positives + false_negatives);
	specificity = true_negatives / (true_negatives + false_positives);

	M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
	
	if (firstTime == 1)
		dlmwrite('test_single_results.csv',M,'delimiter',',');
		firstTime = 0;
	else
		dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
	end
end


%============================================================FeedForward=====================================================================

networkName = 'trainedNetworks/FeedForward/net_FeedForward_';

for j=1:length(trainFunctions1)

	current_Train = char(trainFunctions1(j));

	for i=1:length(hiddenLayersSizes)

		networkName_temp = strcat(networkName, current_Train, '_mse_', num2str(hiddenLayersSizes(i)), '.mat');

		load(networkName_temp);

		network_results = sim(network, test_input);
		network_results = convertResults(network_results);

		expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
		got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

		[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

		sensitivity = true_positives / (true_positives + false_negatives);
		specificity = true_negatives / (true_negatives + false_positives);

		M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];
		
		dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
	end
end

%=======================================================Layer Recurrent=======================================================================

networkName = 'trainedNetworks/Layer Recurrent Network/net_Layer Recurrent_';

for j=1:length(trainFunctions1)

	current_Train = char(trainFunctions1(j));

	for i=1:length(hiddenLayersSizes)

		networkName_temp = strcat(networkName, current_Train, '_mse_', num2str(hiddenLayersSizes(i)), '.mat');

		load(networkName_temp);

		network_results = sim(network, test_input);
		network_results = convertResults(network_results);

		expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
		got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

		[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

		sensitivity = true_positives / (true_positives + false_negatives);
		specificity = true_negatives / (true_negatives + false_positives);

		M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

		dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
	end
end

%======================================================Distributed Time Delay==================================================================

networkName = 'trainedNetworks/Distributed Time Delay/net_Distributed Time Delay_';

for j=1:length(trainFunctions1)

	current_Train = char(trainFunctions1(j));

	for k=1:length(activationsFunctions1)

		activationFunction = char(activationsFunctions1(k));

		for i=1:length(hiddenLayersSizes)

			networkName_temp = strcat(networkName, current_Train, '_mse_', activationFunction, '_' ,num2str(hiddenLayersSizes(i)), '.mat');

			load(networkName_temp);

			network_results = sim(network, test_input);
			network_results = convertResults(network_results);

			expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
			got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

			[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

			sensitivity = true_positives / (true_positives + false_negatives);
			specificity = true_negatives / (true_negatives + false_positives);

			M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

			dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
		end
	end
end

%{
%=======================================================FF Input Time Delay====================================================================

networkName = 'trainedNetworks/FF Input Time Delay/net_FF Input Time Delay_';

for j=1:length(trainFunctions1)

	current_Train = char(trainFunctions1(j));

	for k=1:length(activationsFunctions1)

		activationFunction = char(activationsFunctions1(k));

		for i=1:length(hiddenLayersSizes)

			networkName_temp = strcat(networkName, current_Train, '_mse_', activationFunction, '_' ,num2str(hiddenLayersSizes(i)), '.mat');

			load(networkName_temp);

			network_results = sim(network, test_input);
			network_results = convertResults(network_results);

			expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
			got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

			[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

			sensitivity = true_positives / (true_positives + false_negatives);
			specificity = true_negatives / (true_negatives + false_positives);

			M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

			dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
		end
	end
end
%}