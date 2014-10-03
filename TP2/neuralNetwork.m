%%%%
%% This file has all the code related to the Neural Network, considered for the classifier
%%%%

%%%%
%% Creates a new neural network, either a Perceptron or a Feedforward Network, depending on the user's choice. This neural network
%% is going to be used as the classifier
%%%%
function my_network = createNetwork(network_type, nA, nP)

	%Depending on the network type we will be using different parameters
	if (network_type == 1)
		%Feedforward Network

		
		keep_going = 1;
		while keep_going == 1
			temp = input('Select the desired activation function (1 - sigmoidal; 2 - linear):\n');
			if temp == 1
				activation_function = 'logsig';
				break;
			else if temp == 2
				activation_function = 'purelin';
				break;
			end

		% The assignment refers the "feedforwardnet" instead of the "newff" function. In fact, the "newff" function is obsoleted, however,
		% if we use the "feedforwardnet" function we are not able to define the weights and bias of the network by accessing net.IW and
		% net.b . Because we not able to find a suitable replacement for this, the decision to use the obsoleted function was made.
		net = newff( ones(nP,1)*[0 1] , nA, {activation_function}, 'trainlm');

		%Initializate the network
		my_network = init(my_network);

	else
		%Perceptron

		%Activation Function
		activation_function = 'hardlim';

		%Learning Method
		keep_going = 1;
		while keep_going == 1
			temp = input('Select the desired learning method (1 - Gradient Rule; 2 - Hebb Rule; 3 - Hebb Rule with decaying weight):\n');
			if temp == 1
				learning_method = 'learngd';
				break;
			else if temp == 2
				learning_method = 'learnh';
				break;
			else if temp == 3
				learning_method = 'learnhd';
				break;
			end
		end
				
		my_network = newp(ones(nP,1)*[0 1], nA , activation_function, learning_method);
	end

	keep_going = 1;
	while keep_going == 1
		temp = input('Select the desired perform function (1 - Sum Squared Error; 2 - Mean Squared Error):\n');
		if temp == 1
			performFcn = 'sse';
			break;
		else if temp == 2
			performFcn = 'mse';
			break;
		end
	end

	%Define the network properties
	W = rand(10,256);
	b = rand(10,1);
	my_network.IW{1,1} = W;
	my_network.b{1,1} = b;

	%Define training parameters
	my_network.performParam.ratio = 0.5;   % learning rate
	my_network.trainParam.epochs = 1000;   % maximum epochs
	my_network.trainParam.show = 35;       % show
	my_network.trainParam.goal = 1e-6;     % goal=objective
	my_network.performFcn = performFcn;    % criterion

end

%%%%
%%	Runs the training algorithm for the given data, in the given neural network
%%%%
function trainNetwork(my_network, trainingData, nCases)

	%Generate the target data (classes) for the training (10,Q)
	%Don't forget our drawing order!
	%1 2 3 4 5 6 7 8 9 0
	%1 2 3 4 5 6 7 8 9 0
	%....

	targetData = zeros(10, nCases);
	for i = 1 : nCases
		targetData( mod(i,10), i ) = 1;
	end

	%Train the network for the given data
	net = train(net, trainingData, targetData);
end

%%%%
%%	Saves the given trained neural network into the workspace
%%%%
function saveNetwork(my_network)
	save my_network;
end