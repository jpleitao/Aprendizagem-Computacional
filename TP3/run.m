%%%%
%%
%%  João Tiago Márcia do Nascimento Fernandes   2011162899
%%  Joaquim Pedro Bento Gonçalves Pratas Leitão 2011150072
%%
%%%%
function varargout = run(varargin)
% RUN MATLAB code for run.fig
%      RUN, by itself, creates a new RUN or raises the existing
%      singleton*.
%
%      H = RUN returns the handle to a new RUN or the handle to
%      the existing singleton*.
%
%      RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN.M with the given input arguments.
%
%      RUN('Property','Value',...) creates a new RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help run

% Last Modified by GUIDE v2.5 08-Nov-2014 18:11:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @run_OpeningFcn, ...
                   'gui_OutputFcn',  @run_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before run is made visible.
function run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to run (see VARARGIN)

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%%%
%%  Initialize all the variables we are going to use
%%%%
handles.networkName = 'Layer Recurrent';
handles.network = [];%Network not trained
handles.trainFunction = 'trainscg';
handles.performanceFunction = 'mse';
handles.activationFunction = 'hardlim';
handles.goal = 1e-6;
handles.epochs = 100;
handles.learningRate = 0.5;
handles.numberLayers = 3;
handles.hiddenLayersSizes = 30;
handles.classificationType = 'single';
handles.groupLimitOnes = 5;
handles.window_size = 10;

handles.training_file = '44202.mat';
handles.percentage_training = 70;

handles.test_file = '63502.mat';
handles.percentage_test = 30;

handles.training_input = [];
handles.training_output = [];
handles.test_input = [];
handles.test_output = [];


% Choose default command line output for run
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in trainbutton.
function trainbutton_Callback(hObject, eventdata, handles)
% hObject    handle to trainbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        
    %Get the training and testing data sets
    [handles.training_input, handles.training_output, handles.test_input, handles.test_output] = prepareDataSets(handles);
    
    %Create desired network
    network_data = struct('networkName', handles.networkName, 'trainFunction', handles.trainFunction, 'performanceFunction', handles.performanceFunction, 'goal', handles.goal, 'epochs', handles.epochs, 'learningRate', handles.learningRate, 'numberLayers', handles.numberLayers, 'hiddenLayers', handles.hiddenLayersSizes, 'trainingInput', handles.training_input, 'trainingOutput', handles.training_output, 'activationFunction', handles.activationFunction, 'validationChecks', round(handles.epochs/2));

    handles.network = createNetwork(network_data);

    if (~strcmp(handles.networkName, 'Radial Basis Function'))
        %Train network -- We don't need to train Radial Basis Function because it so badass nobody can teach it!
        disp('Vou treinar');
        handles.network = train(handles.network, handles.training_input, handles.training_output, 'useGPU', 'yes');
        disp('Ja treinei');
    end
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes on button press in testbutton.
function testbutton_Callback(hObject, eventdata, handles)
% hObject    handle to testbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    %%%%
    %% TODO:
    %% 1- Check if desired network is trained
    %% 2a- If desired network is not trained then train it
    %% 2b- Otherwise get the desired trained network
    %% 3- Give the Test Data as an input to the network
    %% 4- Get results and plot them
    %% 5- Analyse the obtained results
    %%%%
    
    %Check if we have a trained network stored
    if (isempty(handles.network))
        %No trained network -- Need to create one and train
        
        %Get the training and testing data sets
        [handles.training_input, handles.training_output, handles.test_input, handles.test_output] = prepareDataSets(handles);
        
        %Create desired network
        network_data = struct('networkName', handles.networkName, 'trainFunction', handles.trainFunction, 'performanceFunction', handles.performanceFunction, 'goal', handles.goal, 'epochs', handles.epochs, 'learningRate', handles.learningRate, 'numberLayers', handles.numberLayers, 'hiddenLayers', handles.hiddenLayersSizes, 'trainingInput', handles.training_input, 'trainingOutput', handles.training_output, 'activationFunction', handles.activationFunction, 'validationChecks', round(handles.epochs/2));
        
        disp('vou criar rede')
        handles.network = createNetwork(network_data);
        disp('criada a rede')

        if (~strcmp(handles.networkName, 'Radial Basis Function'))
            %Train network -- We don't need to train Radial Basis Function because it so badass nobody can teach it!
            handles.network = train(handles.network, handles.training_input, handles.training_output);
        end
    end
    
    disp('vou executar a simulacao')
    %Run sim with the test data set
    network_results = sim(handles.network, handles.test_input);
    %network_results = sim(handles.network, handles.training_input);

    network_results = convertResults(network_results);
    
    if (strcmp(handles.classificationType,'group'))
        %Group classification type
        
        expected_output = translateOutputToGroup(handles.test_output, handles.groupLimitOnes, handles.window_size);%The expected output for our neural network
        got_output = translateOutputToGroup(network_results, handles.groupLimitOnes, handles.window_size);%The output of our neural network
        
        [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretGroupedResults(expected_output, got_output);
    else
        %Single classification type
        [true_positives, true_negatives, false_positives, false_negatives, invalid_data, expected_positives, expected_negatives] = interpretResults(handles, network_results);
    end
    
    %Compute sensitivity and specificity
    sensitivity = true_positives / (true_positives + false_negatives);
    specificity = true_negatives / (true_negatives + false_positives);

    %Show sensitivity, specificity and then true positives, false positives and so on
    set(handles.sensitivityTextBox,'String', strcat('Sensitivity:', num2str(sensitivity)));
    set(handles.specificityTextBox,'String', strcat('Specificity:', num2str(specificity)));
    set(handles.truePositivesTextBox,'String', strcat('True Positives:', num2str(true_positives)));
    set(handles.trueNegativesTextBox,'String', strcat('True Negatives:', num2str(true_negatives)));
    set(handles.falsePositivesTextBox,'String', strcat('False Positives:', num2str(false_positives)));
    set(handles.falseNegativesTextBox,'String', strcat('False Negatives:', num2str(false_negatives)));
    set(handles.invalidDataText,'String', strcat('Invalid Data:', num2str(invalid_data)));
    set(handles.expectedPositivesText, 'String', strcat('Expected Positives:', num2str(expected_positives)));
    set(handles.expectedNegativesText, 'String', strcat('Expected Negatives:', num2str(expected_negatives)));

    %{
    training_input = handles.training_input;
    training_output = handles.training_output;
    test_input = handles.test_input;
    test_output = handles.test_output;
    save('ResultadosBonitos.mat', 'training_input', 'training_output', 'test_input', 'test_output', 'true_positives', 'true_negatives', 'false_negatives', 'false_positives');
    %}
    
    % Update handles structure
    guidata(hObject, handles);

% --- Executes on selection change in trainingDataListBox.
function trainingDataListBox_Callback(hObject, eventdata, handles)
% hObject    handle to trainingDataListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns trainingDataListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from trainingDataListBox

    contents = cellstr(get(hObject,'String'));
    handles.training_file = contents{get(hObject,'Value')};
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function trainingDataListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trainingDataListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function percentageCrysisTrainInput_Callback(hObject, eventdata, handles)
% hObject    handle to percentageCrysisTrainInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentageCrysisTrainInput as text
%        str2double(get(hObject,'String')) returns contents of percentageCrysisTrainInput as a double

    handles.percentage_training = str2double(get(hObject,'String'));
    handles.percentage_test = 100 - handles.percentage_training;
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function percentageCrysisTrainInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentageCrysisTrainInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in neuralNetworkTypePopUp.
function neuralNetworkTypePopUp_Callback(hObject, eventdata, handles)
% hObject    handle to neuralNetworkTypePopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns neuralNetworkTypePopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from neuralNetworkTypePopUp
    contents = cellstr(get(hObject,'String'));
    handles.networkName = contents{get(hObject,'Value')};
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function neuralNetworkTypePopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neuralNetworkTypePopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handstr2double(get(hObject,'String')) les not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in testDataListBox.
function testDataListBox_Callback(hObject, eventdata, handles)
% hObject    handle to testDataListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns testDataListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from testDataListBox
    contents = cellstr(get(hObject,'String'));
    handles.test_file = contents{get(hObject,'Value')};
    
    % Update handles structure
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function testDataListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testDataListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalTextField_Callback(hObject, eventdata, handles)
% hObject    handle to goalTextField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalTextField as text
%        str2double(get(hObject,'String')) returns contents of goalTextField as a double
	handles.goal = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function goalTextField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalTextField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epochsInput_Callback(hObject, eventdata, handles)
% hObject    handle to epochsInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epochsInput as text
%        str2double(get(hObject,'String')) returns contents of epochsInput as a double
    handles.epochs = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function epochsInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epochsInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in trainFunctionsList.
function trainFunctionsList_Callback(hObject, eventdata, handles)
% hObject    handle to trainFunctionsList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns trainFunctionsList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from trainFunctionsList
    contents = cellstr(get(hObject,'String'));
    handles.trainFunction = contents{get(hObject,'Value')};
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function trainFunctionsList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trainFunctionsList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in performanceList.
function performanceList_Callback(hObject, eventdata, handles)
% hObject    handle to performanceList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns performanceList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from performanceList
    contents = cellstr(get(hObject,'String'));
    handles.performanceFunction = contents{get(hObject,'Value')};
    
    % Update handles structure
    guidata(hObject, handles);    


% --- Executes during object creation, after setting all properties.
function performanceList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to performanceList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function learningRateEdit_Callback(hObject, eventdata, handles)
% hObject    handle to learningRateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of learningRateEdit as text
%        str2double(get(hObject,'String')) returns contents of learningRateEdit as a double
    handles.learningRate = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function learningRateEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to learningRateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hiddenLayersSizeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenLayersSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hiddenLayersSizeEdit as text
%        str2double(get(hObject,'String')) returns contents of hiddenLayersSizeEdit as a double
    handles.hiddenLayersSizes = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function hiddenLayersSizeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenLayersSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function layerDelaysEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layerDelaysEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentageCrysisTestInput_Callback(hObject, eventdata, handles)
% hObject    handle to percentageCrysisTestInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentageCrysisTestInput as text
%        str2double(get(hObject,'String')) returns contents of percentageCrysisTestInput as a double
    handles.percentage_test = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function percentageCrysisTestInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentageCrysisTestInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in classificationType.
function classificationType_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in classificationType 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

    selected = get(eventdata.NewValue,'Tag');
    
    if (strcmp(selected, 'singleClassificationTypeButton'))
        handles.classificationType = 'single';
    else
        handles.classificationType = 'group';
    end
    
    % Update handles structure
    guidata(hObject, handles);



function numLayersInput_Callback(hObject, eventdata, handles)
% hObject    handle to numLayersInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numLayersInput as text
%        str2double(get(hObject,'String')) returns contents of numLayersInput as a double
    handles.numberLayers = str2double(get(hObject,'String'));
    
    % Update handles structure
    guidata(hObject, handles); 


% --- Executes during object creation, after setting all properties.
function numLayersInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numLayersInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in activationFunctionList.
function activationFunctionList_Callback(hObject, eventdata, handles)
% hObject    handle to activationFunctionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns activationFunctionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from activationFunctionList

    contents = cellstr(get(hObject,'String'));
    handles.activationFunction = contents{get(hObject,'Value')};


% --- Executes during object creation, after setting all properties.
function activationFunctionList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to activationFunctionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
