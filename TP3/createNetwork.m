%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%	Creates one neural network, according to the user selection. To create the network the user must also specify some of its properties,
%%	depending on the type of network to create. These properties may be the train function, used in the network's training, or its neurons'
%%	activation function. It can also be the desired number of layer, or even the goal and number of epochs to use in the train.
%%	Once the network is created some of its parameters are specified, like the learning rate, performance function (used in the training to
%%	evaluate the network's performance) and number of validation checks needed to stop the train.
%%	Finally, the created network is returned, to be used in later stages of the execution, either for training, or to classify a given
%%	data set.
%%%%
function my_network = createNetwork(network_data)

	%%%%
	%%	network_data = struct('networkName', handles.networkName, 'trainFunction', handles.trainFunction,
	%%						  'performanceFunction', handles.performanceFunction, 'goal', handles.goal, 'epochs', handles.epochs,
	%%						  'learningRate', handles.learningRate, 'numberLayers', handles.numberLayers,
	%%						  'hiddenLayers', handles.hiddenLayersSizes, 'trainingInput', handles.training_input, 
	%%						  'trainingOutput', handles.training_output,
	%%						  'activationFunction', handles.activationFunction, 'validationChecks', validationChecks);
	%%%%

	if (strcmp(network_data.networkName, 'Radial Basis Function'))

		%Create the network, giving it the training input and output data, and the desired goal for our training
		my_network = newrb(network_data.trainingInput, network_data.trainingOutput, network_data.goal, 1.0, network_data.hiddenLayers, 1);

	elseif (strcmp(network_data.networkName, 'Layer Recurrent'))

		%Define some of the network's specifications
		layersDelays = 1:2;
		layersSize = [repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1)];

		%Create the network
		my_network = layrecnet(layersDelays, layersSize, network_data.trainFunction);

		%Define specific parameters of the network
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
        my_network.trainParam.max_fail = network_data.validationChecks;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'FeedForward'))

		%Define some of the network's specifications
		layersSize = repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1);
		
		%Create the network
		my_network = feedforwardnet(layersSize, network_data.trainFunction);

		%Define specific parameters of the network
        my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
        my_network.trainParam.max_fail = network_data.validationChecks;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'FF Input Time Delay'))

		%Define some of the network's specifications
		activationFunctions = [repmat( {network_data.activationFunction}, 1, network_data.numberLayers - 1)];
		layersSize = [repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1)];

		%Create the network
		my_network = newfftd(network_data.trainingInput, network_data.trainingOutput,  0:network_data.numberLayers - 1, layersSize, activationFunctions, network_data.trainFunction);

		%Define specific parameters of the network
		W = 0.1*rand(size(my_network.IW{1,1}));
		b = 0.1*rand(size(my_network.b{1,1}));

		my_network.IW{1,1} = W;
		my_network.b{1,1} = b;
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
        my_network.trainParam.max_fail = network_data.validationChecks;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'Distributed Time Delay'))

		%Define some of the network's specifications
		layersSize = repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1);
		layersDelays = {0:network_data.numberLayers - 1};
		activationFunctions = [repmat( {network_data.activationFunction}, 1, network_data.numberLayers - 1)];

		%Create the network
		my_network = newdtdnn(network_data.trainingInput, network_data.trainingOutput, layersSize, layersDelays, activationFunctions, network_data.trainFunction);

		%Define specific parameters of the network
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
        my_network.trainParam.max_fail = network_data.validationChecks;
		my_network.performFcn = network_data.performanceFunction;
	end
end