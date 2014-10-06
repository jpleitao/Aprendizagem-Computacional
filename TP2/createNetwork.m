%%%%
%%	Creates a new neural network, either a Perceptron or a Feed-Forward Backpropagation Network, depending on the user's choice.
%%	This neural network is going to be used as the classifier.
%%
%%	Uppon creation, the architecture and properties of the network are prompted to the user, and according to the user's selection
%%	a Feed-Forward Backpropagation Network or a Perceptron are created. Once the network is created its properties are set, some are
%%	selected by the user (like the activation and performing function) while others have a fixed, previously selected values (like the
%%	learning rate), and others are randomly generated (like the weights and bias of the network). Once the properties of the network are
%%	set, it is trained with the training data, which has already been generated.
%%%%
function my_network = createNetwork(network_type, currentData)

	%Load training data
	load('Pfinal.mat');
	trainingData = Pfinal;

	nA = 10;
	[nP, nCases] = size(trainingData);

	%Depending on the network type we will be using different parameters
	if (network_type == 1)
		%Feedforward Network

		keep_going = 1;
		while (keep_going == 1)
			temp = input('Select the desired activation function.\n1 - sigmoidal\n2 - linear\n3 - Hard-limit\n');
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

		% The assignment refers the "feedforwardnet" instead of the "newff" function. In fact, the "newff" function is obsoleted, however,
		% if we use the "feedforwardnet" function we are not able to define the weights and bias of the network by accessing net.IW and
		% net.b . Because we not able to find a suitable replacement for this, the decision to use the obsoleted function was made.
		my_network = newff( ones(nP,1)*[0 1] , nA, {activation_function}, 'trainlm');
	end

	if (network_type == 2)%Matlab wasn't liking it when we replaced this if with an else, so let's keep what works!
		%Perceptron

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

		%Learning Method
		keep_going = 1;
		while (keep_going == 1)
			temp = input('\nSelect the desired learning method\n1 - Gradient Rule\n2 - Hebb Rule\n3 - Hebb Rule with decaying weight\n4 - Perceptron weight and bias\n');
			if (temp == 1)
				learning_method = 'learngd';
				break;
			elseif (temp == 2)
				learning_method = 'learnh';
				break;
			elseif (temp == 3)
				learning_method = 'learnhd';
				break;
			elseif (temp == 4)
				learning_method = 'learnp';
				break;
			end
		end

		my_network = newp(ones(nP,1)*[0 1], nA , activation_function, learning_method);
	end

	keep_going = 1;
	while (keep_going == 1)
		temp = input('\nSelect the desired perform function\n1 - Sum Squared Error\n2 - Mean Squared Error\n');
		if (temp == 1)
			performFcn = 'sse';
			break;
		elseif (temp == 2)
			performFcn = 'mse';
			break;
		end
	end

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
	my_network.performFcn = performFcn;		% criterion

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