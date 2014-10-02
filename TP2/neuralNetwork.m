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

%%%
%%	VERY IMPORTANT NOTE!
%%	The assignment cleary states the following: "It is assumed that the classifier is a neural network (see chapter 5) consisting of:
%%		-> ONE SINGLE LAYER
%%		-> A linear or non-linear activation function, namely perceptron, linear, sigmoidal
%%		-> With bias in each neuron"
%%	It also mentions the use of the "feedforwardnet" function to create a feedforward neural network.
%%
%%	According to the conventions addopted in this course, in a neural network we consider that all the layers which are not an exit layer
%%	are considered to be an hidden layer. Because the assignment clearly states that the neural network should have 1 layer and the function
%%	"feedforwardnet" should be used, in the following code we are creating a feedforward neural network with one hidden layer.
%%	We are not sure if by stating that the neural netowrk should have one layer, it is meant that there should be one hidden layer (the
%%	starting layer) which is also the exit layer. However, since we cannot call "feedforwardnet(0)", we assumed that the logical solution
%%	would have to be considering one hidden layer.
%%%
		%Using the default backpropagation training function, "trainlm", which implements the Levenberg-Marquardt algorithm
		learning_method = 'learngd';%Gradient Rule --> Since logsig or purlin have been choosen as activation functions

		my_network = feedforwardnet(1, learning_method);

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
				keep_going = 0;
			else if temp == 2
				learning_method = 'learnh';
				keep_going = 0;
			else if temp == 3
				learning_method = 'learnhd';
				keep_going = 0;
			else
				keep_going = 1;
			end
		end
				
		my_network = newp(ones(nP,1)*[0 1], nA , activation_function, learning_method );
	end

	keep_going = 1;
	while keep_going == 1
		temp = input('Select the desired perform function (1 - Sum Squared Error; 2 - Mean Squared Error):\n');
		if temp == 1
			performFcn = 'sse';
			keep_going = 0;
		else if temp == 2
			performFcn = 'mse';
			keep_going = 0;
		else
			keep_going = 1;
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