%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function my_network = createNetwork(network_data)

	%%%%
	%%	network_data = struct('networkName', handles.networkName, 'trainFunction', handles.trainFunction,
	%%						  'performanceFunction', handles.performanceFunction, 'goal', handles.goal, 'epochs', handles.epochs,
	%%						  'learningRate', handles.learningRate, 'numberLayers', handles.numberLayers,
	%%						  'hiddenLayersSizes', handles.hiddenLayersSizes, 'layerDelays', handles.layerDelays,
	%%						  'trainingInput', handles.training_input, 'trainingOutput', handles.training_output,
	%%						  'activationFunction', handles.activationFunction);
	%%%%

	if (strcmp(network_data.networkName, 'Radial Basis Function'))

		%newrb(X,T,GOAL,SPREAD,MN,DF) takes these arguments,
     	%X      - RxQ matrix of Q input vectors.
    	%T      - SxQ matrix of Q target class vectors.
     	%GOAL   - Mean squared error goal, default = 0.0.
     	%SPREAD - Spread of radial basis functions, default = 1.0.
     	%MN     - Maximum number of neurons, default is Q.
     	%DF     - Number of neurons to add between displays, default = 25

     	%%%%
     	%%	Use the default values of Spread, MN and DF!
     	%%	Remember that, here the input matrix is NumberCharacteristics x NumberCases
     	%%	and the output matrix is NumberOutputLayerNeurons x NumberCharacteristics 
     	%%%%
		my_network = newrb(network_data.trainingInput, network_data.trainingOutput, network_data.goal);

	elseif (strcmp(network_data.networkName, 'Layer Recurrent'))

		%net=layrecnet(layerDelays,hiddenSizes,trainFcn)

		%Considering two neurons in the output layer
		layersDelays = 1:2;
		number_neurons_outputLayer = 2;
		layersSize = [repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1) number_neurons_outputLayer];

		my_network = layrecnet(layersDelays, layersSize, network_data.trainFunction);

		%Define specific parameters of the network
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'FeedForward'))

		%hiddenLayers = network_data.numberLayers - 1;
		layersSize = repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1);
		
		my_network = feedforwardnet(layersSize, network_data.trainFunction);

		%Define specific parameters of the network
        my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'FF Input Time Delay'))

		%We have 29 characteristics
        training_input_temp = network_data.trainingInput;
        training_input_temp = training_input_temp';
        min_max_values = minmax(training_input_temp);
		activationFunctions = [repmat( {network_data.activationFunction}, 1, network_data.numberLayers - 1) {'purelin'}];
		number_neurons_outputLayer = 2;
		layersSize = [repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1) number_neurons_outputLayer];

		%my_network = newfftd(min_max_values,  0:network_data.numberLayers - 1, layersSize, activationFunctions, network_data.trainFunction);
		my_network = newfftd(network_data.trainingInput, network_data.trainingOutput,  0:network_data.numberLayers - 1, layersSize, activationFunctions, network_data.trainFunction);

		%Define specific parameters of the network
		W = 0.1*rand(size(my_network.IW{1,1}));%This seems to be working...
		b = 0.1*rand(size(my_network.b{1,1}));

		my_network.IW{1,1} = W;
		my_network.b{1,1} = b;
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'Perceptron'))

		%We have 29 characteristics
        training_input_temp = network_data.trainingInput;
        training_input_temp = training_input_temp';
        min_max_values = minmax(training_input_temp);
        number_neurons_outputLayer = 2;

		%my_network = newp(min_max_values, number_neurons_outputLayer, network_data.activationFunction, network_data.trainFunction);
		my_network = newp(network_data.trainingInput, network_data.trainingOutput, network_data.activationFunction, network_data.trainFunction);

		%Define specific parameters of the network
		W = 0.1*rand(size(my_network.IW{1,1}));%This seems to be working...
		b = 0.1*rand(size(my_network.b{1,1}));

		my_network.IW{1,1} = W;
		my_network.b{1,1} = b;	
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;

	elseif (strcmp(network_data.networkName, 'Distributed Time Delay'))

		layersSize = repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1);
		layersDelays = {0:network_data.numberLayers - 1};
		activationFunctions = [repmat( {network_data.activationFunction}, 1, network_data.numberLayers - 1) {'purelin'}];

		my_network = newdtdnn(network_data.trainingInput, network_data.trainingOutput, layersSize, layersDelays, activationFunctions, network_data.trainFunction);

		%Define specific parameters of the network
		my_network.performParam.lr = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;
	end
end