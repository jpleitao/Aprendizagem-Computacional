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
	%%						  'trainingInput', handles.training_input, 'trainingOutput', handles.training_output);
	%%%%

	if (strcmp(network_data.networkName, 'Radial Basis Function'))

		%%%%
		%%	FIXME: IS THIS BEING DONE IN THE RIGHT WAY??
		%%%%

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

	elseif(strcmp(network_data.networkName, 'Layer Recurrent'))

		%%%%
		%%	FIXME: IS THIS BEING DONE IN THE RIGHT WAY??
		%%%%

		%net=layrecnet(layerDelays,hiddenSizes,trainFcn)

		%Considering one neuron in the output layer -- This should be what we are supposed to do!
		layersDelays = 1:2;
		layersSize = [repmat( network_data.hiddenLayers, 1, network_data.numberLayers - 1) 1];

		my_network = layrecnet(layersDelays, layersSize, network_data.trainFunction);

		%Define specific parameters of the network
		%my_network.performParam.ratio = network_data.learningRate;
		my_network.trainParam.epochs = network_data.epochs;
		my_network.trainParam.show = 35;
		my_network.trainParam.goal = network_data.goal;
		my_network.performFcn = network_data.performanceFunction;


	elseif(strcmp(network_data.networkName, 'FeedForward'))
		
		%FIXME: USAR newff ou feedforwardnet?
		%my_network = ;
	end
end