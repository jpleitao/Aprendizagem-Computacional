percentage_training = 70;
training_file = '92202.mat';

networkNames1 = {'Layer Recurrent', 'FeedForward', 'FF Input Time Delay', 'Perceptron', 'Distributed Time Delay'};
%trainFunctions1 = {'trainlm', 'traingd', 'trainbfg', 'trainrp' , 'learnp', 'learngd'};
trainFunctions1 = {'trainlm', 'traingd', 'trainrp'};
performanceFunctions1 = {'mse'};
activationsFunctions1 = {'hardlim', 'purelin', 'logsig', 'tansig'};
goal = 1e-6;
goalNEWRB = 0.01;
epochs = 1000;
validationChecks = epochs/2;
learningRate = 0.5;
numberLayers = 2;
hiddenLayersSizes = [3, 7, 15];

handles = struct('percentage_training', percentage_training, 'training_file', training_file);

[training_input, training_output, test_input, test_output] = prepareDataSets(handles);


%%%%
%%	Layrecnet
%%%%
networkName = 'Layer Recurrent';

for i=1:length(trainFunctions1)

	trainFunction = char(trainFunctions1(i));

	for k=1:length(performanceFunctions1)
            
		performanceFunction = char(performanceFunctions1(k));

		for m=1:length(hiddenLayersSizes)

			currentSize = hiddenLayersSizes(m);

			network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'validationChecks', validationChecks);

			network = createNetwork(network_data);
			network = train(network, training_input, training_output, 'useGPU', 'yes');

			%Save trained network
			network_name = strcat('trainedNetworks/net_', networkName, '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
			save(network_name, 'network');
		end
	end
end

%%%%
%%	Feedforward
%%%%
networkName = 'FeedForward';

for i=1:length(trainFunctions1)

	trainFunction = char(trainFunctions1(i));
	
	for k=1:length(performanceFunctions1)
            
		performanceFunction = char(performanceFunctions1(k));

		for m=1:length(hiddenLayersSizes)

			currentSize = hiddenLayersSizes(m);

			network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'validationChecks', validationChecks);

			network = createNetwork(network_data);
			network = train(network, training_input, training_output, 'useGPU', 'yes');

			%Save trained network
			network_name = strcat('trainedNetworks/net_', networkName, '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
			save(network_name, 'network');
		end
	end
end

%%%%
%%	FF Input Time Delay
%%%%
networkName = 'FF Input Time Delay';

for i=1:length(trainFunctions1)

	trainFunction = char(trainFunctions1(i));

	for j=1:length(activationsFunctions1)

		activationFunction = char(activationsFunctions1(j));
	
		for k=1:length(performanceFunctions1)

			performanceFunction = char(performanceFunctions1(k));

			for m=1:length(hiddenLayersSizes)

				currentSize = hiddenLayersSizes(m);

				network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'activationFunction', activationFunction, 'validationChecks', validationChecks);

				network = createNetwork(network_data);
				network = train(network, training_input, training_output, 'useGPU', 'yes');

				%Save trained network
				network_name = strcat('trainedNetworks/net_', networkName, '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
                save(network_name, 'network');
			end
		end
	end
end

%%%%
%%	Distributed Time Delay
%%%%
networkName = 'Distributed Time Delay';

for i=1:length(trainFunctions1)

	trainFunction = char(trainFunctions1(i));

	for j=1:length(activationsFunctions1)

		activationFunction = char(activationsFunctions1(j));
	
		for k=1:length(performanceFunctions1)

			performanceFunction = char(performanceFunctions1(k));

			for m=1:length(hiddenLayersSizes)

				currentSize = hiddenLayersSizes(m);

				network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', currentSize, 'trainingInput', training_input, 'trainingOutput', training_output, 'activationFunction', activationFunction, 'validationChecks', validationChecks);

				network = createNetwork(network_data);
				network = train(network, training_input, training_output, 'useGPU', 'yes');

				%Save trained network
				network_name = strcat('trainedNetworks/net_', networkName, '_', trainFunction, '_', performanceFunction, '_',num2str(currentSize), '.mat');
                save(network_name, 'network');
			end
		end
	end
end


%%%%
%%	Newrb
%%%%
networkName = 'Radial Basis Function';
network = newrb(training_input, training_output, goalNEWRB);
network_name = strcat('net_', networkName, '_',num2str(currentSize), '.mat');
save(network_name, 'network');
