percentage_training = 30;
training_file = '44202.mat';

trainFunctions = {'trainrp', 'trainscg'};
performanceFunctions = {'mse'};
activationsFunctions = {'hardlim', 'purelin', 'logsig', 'tansig'};
goal = 1e-6;
goalNEWRB = 0.01;
epochs = 1000;
validationChecks = epochs/2;
learningRate = 0.5;
numberLayers = 2;
hiddenLayersSizes = [3, ceil(log2(29))];
number_characteristics = [5, 15];



%%%%
%%	Newrb
%%%%
networkName = 'Radial Basis Function';

for i=1:length(number_characteristics)
    
    current_characteristic = number_characteristics(i);
    
    handles = struct('percentage_training', percentage_training, 'training_file', training_file, 'characteristics', current_characteristic);

    [training_input, training_output, test_input, test_output] = prepareDataSets(handles);

    for m=1:2

        currentSize = hiddenLayersSizes(m);

        network = newrb(training_input, training_output, goalNEWRB, 1.0, currentSize, 1);
        network_name = strcat('trainedNetworks/net_', networkName, '_reduced', num2str(current_characteristic), '_', num2str(currentSize), '.mat');
        save(network_name, 'network');
    end
end

%%%%
%%	Feedforward
%%%%
networkName = 'FeedForward';

for l=1:length(number_characteristics)
    
    current_characteristic = number_characteristics(l);
    
    handles = struct('percentage_training', percentage_training, 'training_file', training_file, 'characteristics', current_characteristic);

    [training_input, training_output, test_input, test_output] = prepareDataSets(handles);

    for i=1:length(trainFunctions)

        trainFunction = char(trainFunctions(i));

        for k=1:length(performanceFunctions)

            performanceFunction = char(performanceFunctions(k));

            for m=1:length(hiddenLayersSizes)

                currentSize = hiddenLayersSizes(m);

                network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'validationChecks', validationChecks);

                network = createNetwork(network_data);
                network = train(network, training_input, training_output, 'useGPU', 'yes');

                %Save trained network
                network_name = strcat('trainedNetworks/net_', networkName, '_reduced', num2str(current_characteristic), '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
                save(network_name, 'network');
            end
        end
    end
end

%%%%
%%	Layrecnet
%%%%
networkName = 'Layer Recurrent';

for l=1:length(number_characteristics)
    
    current_characteristic = number_characteristics(l);
    
    handles = struct('percentage_training', percentage_training, 'training_file', training_file, 'characteristics', current_characteristic);

    [training_input, training_output, test_input, test_output] = prepareDataSets(handles);

    for i=1:length(trainFunctions)

        trainFunction = char(trainFunctions(i));

        for k=1:length(performanceFunctions)

            performanceFunction = char(performanceFunctions(k));

            for m=1:length(hiddenLayersSizes)

                currentSize = hiddenLayersSizes(m);

                network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'validationChecks', validationChecks);

                network = createNetwork(network_data);
                network = train(network, training_input, training_output, 'useGPU', 'yes');

                %Save trained network
                network_name = strcat('trainedNetworks/net_', networkName, '_reduced', num2str(current_characteristic), '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
                save(network_name, 'network');
            end
        end
    end
end

%%%%
%%	Distributed Time Delay
%%%%
networkName = 'Distributed Time Delay';

trainFunctions = {'trainscg'};

for l=1:length(number_characteristics)
    
    current_characteristic = number_characteristics(l);
    
    handles = struct('percentage_training', percentage_training, 'training_file', training_file, 'characteristics', current_characteristic);

    [training_input, training_output, test_input, test_output] = prepareDataSets(handles);

    for i=1:length(trainFunctions)

        trainFunction = char(trainFunctions(i));

        for j=1:length(activationsFunctions)

            activationFunction = char(activationsFunctions(j));

            for k=1:length(performanceFunctions)

                performanceFunction = char(performanceFunctions(k));

                for m=1:length(hiddenLayersSizes)

                    currentSize = hiddenLayersSizes(m);

                    network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'activationFunction', activationFunction, 'validationChecks', validationChecks);

                    network = createNetwork(network_data);
                    network = train(network, training_input, training_output, 'useGPU', 'yes');

                    %Save trained network
                    network_name = strcat('trainedNetworks/net_', networkName, '_reduced', num2str(current_characteristic), '_', trainFunction, '_', performanceFunction, '_', activationFunction, '_',num2str(currentSize), '.mat');
                    save(network_name, 'network');
                end
            end
        end
    end
end