%%%%
%%	Creates a new Perceptron Neural Network, which is going to be used as the application's classifier. To create the network we used
%%	previously requested information to the user (like the network's activation function).
%%	Once the network is created its properties are set, like the initial weights, bias, perform function, etc. After this step is done the
%%	network is trained with a previously generated training data.
%%	The new, trained, network is then returned so it can be used and saved for future executions of the application under the same conditions.
%%	To compute the result of the network for a given set of inputs, one just has to call "result = sim(network, data);" after the network
%%	has been created and trained (This is done in "myclassify.m").
%%%%
function my_network = createNetwork(currentData, activation_function, learning_method)

	%Load training data with 500 elements
	load('PTreino500.mat');
	trainingData = PTreino500;
	[nP, nCases] = size(trainingData);


%=====================================================Create the Perceptron==================================================================

	%Set network parameter (number of distincted classes)
	nA = 10;

	my_network = newp(ones(nP,1)*[0 1], nA , activation_function, learning_method);

	%Define the network properties
	W = 0.1*rand(10,256);
	b = 0.1*rand(10,1);
	my_network.IW{1,1} = W;
	my_network.b{1,1} = b;

	%Define training parameters
	my_network.performParam.ratio = 0.5;	% learning rate
	my_network.trainParam.epochs = 1000;	% maximum epochs
	my_network.trainParam.show = 35;		% show
	my_network.trainParam.goal = 1e-6;		% goal=objective
	my_network.performFcn = 'sse';			% criterion

%=====================================================Train the Network======================================================================

	%%%%
	%%	Generate the target data (classes) for the training (10,Q)
	%%%%

	%Don't forget our drawing order for the training data!
	%1 2 3 4 5 6 7 8 9 0
	%1 2 3 4 5 6 7 8 9 0
	%....

	targetData = zeros(10, nCases);
	temp = 0;
	while (temp < nCases)
		targetData( mod(temp,10) + 1, temp + 1) = 1;
		temp = temp + 1;
	end

	%Train the network for the given data
	my_network = train(my_network, trainingData, targetData);
end