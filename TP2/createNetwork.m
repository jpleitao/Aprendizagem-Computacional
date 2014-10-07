%%%%
%%	Creates a new neural network, either a Perceptron or a Feed-Forward Backpropagation Network, depending on the user's choice.
%%	This neural network is going to be used as the classifier.
%%
%%	Uppon creation, the architecture and properties of the network are prompted to the user, and a Perceptron are created.
%%	Once the network is created its properties are set, some are selected by the user (like the activation and performing function)
%%	while others have a fixed, previously selected values (like the learning rate), and others are randomly generated (like the weights
%%	and bias of the network). Once the properties of the network are set, it is trained with the training data, which has already been
%%	generated.
%%	To compute the result of the network for a given set of inputs, one just has to call "result = sim(network, data);" after the network
%%	has been created and trained.
%%%%
function my_network = createNetwork(currentData)

	%Load training data with 50 elements
	%load('Pfinal.mat');
	%trainingData = Pfinal;

	%Load training data with 500 elements
	load('PTreino500.mat');
	trainingData = PTreino500;

	nA = 10;
	[nP, nCases] = size(trainingData);


%=====================================================Create the Perceptron========================================================

	%Activation Function
	keep_going = 1;
	while (keep_going == 1)
		temp = input('\nSelect the desired activation function.\n1 - sigmoidal\n2 - linear\n3 - Hard-limit\n');
		if (temp == 1)
			activation_function = 'logsig';
			break;
		elseif (temp == 2)
			activation_function = 'purelin';
			break;
		elseif (temp == 3)
			activation_function = 'hardlim';
			break;
		end
	end

	%Learning Method - "The neural network parameters should be evaluated using the perceptron rule (learnp), if harlim is used,
	%					or the gradient method (learngd) if purlin or logsig are used"
	if (temp == 3)
		learning_method = 'learnp';
	else
		learning_method = 'learngd';
	end

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

%=====================================================Train the Network=======================================================

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