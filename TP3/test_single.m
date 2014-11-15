%%%%
%%	Single Classification
%%%%

activationsFunctions1 = {'hardlim', 'purelin', 'logsig', 'tansig'};
hiddenLayersSizes = [3, ceil(log2(29))];
percentages = [30, 50, 70];
reduces = [5, 15];

firstTime = 1;
groupLimitOnes = 5;
window_size = 10;

for percentage_index=1:3
    percentage = percentages(percentage_index);
    
    %========================================================Radial Basis Function=================================================================

    networkName = 'trainedNetworks/net_Radial Basis Function_reduced';
    
    for u=1:length(reduces)
        
        current_reduce = reduces(u);
        
        load(strcat('44202_reduced_', num2str(current_reduce), '_train', num2str(percentage), '.mat'));
        
        for i=1:length(hiddenLayersSizes)

            networkName_temp = strcat(networkName, num2str(current_reduce), '_', num2str(hiddenLayersSizes(i)), '.mat');
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
        
    end
end

trainFunctions1 = {'trainrp', 'trainscg'};

for percentage_index=1:3
    percentage = percentages(percentage_index);
    
    %============================================================FeedForward=====================================================================

    networkName = 'trainedNetworks/net_FeedForward_reduced';
    
    for u=1:length(reduces)
        
        current_reduce = reduces(u);
        
        load(strcat('44202_reduced_', num2str(current_reduce), '_train', num2str(percentage), '.mat'));

        for j=1:length(trainFunctions1)

            current_Train = char(trainFunctions1(j));

            for i=1:length(hiddenLayersSizes)

                networkName_temp = strcat(networkName, num2str(current_reduce), '_', current_Train, '_mse_', num2str(hiddenLayersSizes(i)), '.mat');

                load(networkName_temp);

                network_results = sim(network, test_input);
                network_results = convertResults(network_results);

                expected_output = translateOutputToGroup(test_output, groupLimitOnes, window_size);
                got_output = translateOutputToGroup(network_results, groupLimitOnes, window_size);

                [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);

                sensitivity = true_positives / (true_positives + false_negatives);
                specificity = true_negatives / (true_negatives + false_positives);

                M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

                %dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
                if (firstTime == 1)
                    dlmwrite('test_single_results.csv',M,'delimiter',',');
                    firstTime = 0;
                else
                    dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
                end
            end
        end
    end
end

for percentage_index=1:3
    percentage = percentages(percentage_index);
    
    %=======================================================Layer Recurrent=======================================================================

    networkName = 'trainedNetworks/net_Layer Recurrent_reduced';
    
    for u=1:length(reduces)
        
        current_reduce = reduces(u);
        
        load(strcat('44202_reduced_', num2str(current_reduce), '_train', num2str(percentage), '.mat'));

        for j=1:length(trainFunctions1)

            current_Train = char(trainFunctions1(j));

            for i=1:length(hiddenLayersSizes)

                networkName_temp = strcat(networkName, num2str(current_reduce), '_', current_Train, '_mse_', num2str(hiddenLayersSizes(i)), '.mat');

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
end

trainFunctions1 = {'trainscg'};

for percentage_index=1:3
    percentage = percentages(percentage_index);

    %======================================================Distributed Time Delay==================================================================

    networkName = 'trainedNetworks/net_Distributed Time Delay_reduced';
    
    for u=1:length(reduces)
        
        current_reduce = reduces(u);
        
        load(strcat('44202_reduced_', num2str(current_reduce), '_train', num2str(percentage), '.mat'));

        for j=1:length(trainFunctions1)

            current_Train = char(trainFunctions1(j));

            for k=1:length(activationsFunctions1)

                activationFunction = char(activationsFunctions1(k));

                for i=1:length(hiddenLayersSizes)

                    networkName_temp = strcat(networkName, num2str(current_reduce), '_', current_Train, '_mse_', activationFunction, '_' ,num2str(hiddenLayersSizes(i)), '.mat');

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

			[true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(test_output, network_results);

			sensitivity = true_positives / (true_positives + false_negatives);
			specificity = true_negatives / (true_negatives + false_positives);

			M = [specificity, sensitivity, true_positives, true_negatives, false_positives, false_negatives, invalid_data];

			dlmwrite('test_single_results.csv',M,'delimiter',',', '-append');
		end
	end
end
%}
