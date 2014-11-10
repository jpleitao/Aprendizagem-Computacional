percentage_training = 70;
training_file = '92202.mat';

networkNames1 = ['Layer Recurrent', 'FeedForward', 'FF Input Time Delay', 'Perceptron', 'Distributed Time Delay'];
trainFunctions1 = ['trainlm', 'traingd', 'trainbfg', 'trainrp' , 'learnp', 'learngd'];
performanceFunctions1 = ['mse', 'sse'];
activationsFunctions1 = ['hardlim', 'purelin', 'logsig', 'tansig'];
goal = 1e-6;
goalNEWRB = 1e-2;
epochs = 1000;
learningRate = 0.2;
numberLayers = 4;
hiddenLayersSizes = 30;

handles = struct('percentage_training', percentage_training, 'training_file', training_file);

[training_input, training_output, test_input, test_output] = prepareDataSets(handles);

for i=1:length(networkNames1)
    
    networkName = networkNames1(i);
    
    for j=1:length(trainFunctions1)
        
        trainFunction = trainFunctions1(j);
        
        for k=1:length(performanceFunctions1)
            
            performanceFunction = performanceFunctions1(k);
            
            for l=1:length(activationsFunctions1)
                
                activationFunction = activationsFunctions1(l);
                
                network_data = struct('networkName', networkName, 'trainFunction', trainFunction, 'performanceFunction', performanceFunction, 'goal', goal, 'epochs', epochs, 'learningRate', learningRate, 'numberLayers', numberLayers, 'hiddenLayers', hiddenLayersSizes, 'trainingInput', training_input, 'trainingOutput', training_output, 'activationFunction', activationFunction);
                
                network = createNetwork(network_data);
                network = train(network, training_input, training_output, 'useGPU', 'yes');
                
                %Save trained network
                network_name = strcat('net_', networkName, '_', trainFunctions, '_', performanceFunction, '_', activation_function, '.mat');
                
                save(network_name, 'network');
                
            end 
        end 
    end
end

%Create the newrb network
networkName = 'Radial Basis Function';
network = newrb(trainingInput, trainingOutput, goal);
network_name = strcat('net_', networkName, '.mat');
