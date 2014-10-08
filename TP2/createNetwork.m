%%%%
%%	Creates a new Perceptron Neural Network, which is going to be used as the application's classifier. To create the network we used
%%	previously requested information to the user (like the network's activation function).
%%	Once the network is created its properties are set, like the initial weights, bias, perform function, etc. After this step is done the
%%	network is trained with a previously generated training data.
%%	The new, trained, network is then returned so it can be used and saved for future executions of the application under the same conditions.
%%	To compute the result of the network for a given set of inputs, one just has to call "result = sim(network, data);" after the network
%%	has been created and trained (This is done in "myclassify.m").
%%%%
function my_network = createNetwork(activation_function, learning_method)

	%Load training data with 500 elements
	load('PTreino500.mat');
	trainingData = PTreino500;
	[nP, nCases] = size(trainingData);

	load('user_associative_choice.mat');
	if (associative == 1)
		%Associtive memory

		%Load the associative memory training type
		load('AM_Training_Type.mat');

		if (training_type == 1)
			%Load the weights of the Hebb training type
			load('associative_weights_Hebb.mat');
		elseif (training_type == 3)
			%Load the weights of the tranpose training type
			load('associative_weights_Transpose.mat');
		else
			%Load the weights of the pinv training type
			load('associative_weights_Pinv.mat');
		end

		%Apply the associative memory to purify the input		
		trainingData = associative_W * trainingData;
	end


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

	load('PerfectArial.mat');
	load('Tfinal500.mat');
    targetData = zeros(10, nCases);
    temp = 1;
    
    while (temp <= nCases)          
        for i = 1 : 10
            if ( Perfect(:,i) == Tfinal500(:,temp) )
                targetData(i, temp) = 1;
                break
            end
        end
		temp = temp + 1;
    end

	%Train the network for the given data
	my_network = train(my_network, trainingData, targetData);
end