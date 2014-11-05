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

% Last Modified by GUIDE v2.5 05-Nov-2014 12:21:33

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

% Choose default command line output for run
handles.output = hObject;

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%%%
%%  Initialize all the variables we are going to use
%%%%
handles.training_file = '44202.mat';
handles.test_file = '44202.mat';
handles.percentage_training = 70;
handles.percentage_test = 100 - handles.percentage_training;
handles.goal = 1e-6;
handles.epochs = 100;
handles.trainFunction = 'trainlm';
handles.performanceFunction = 'mse';
handles.learningRate = 0.5;
handles.hiddenLayers = 30;
handles.layerDelays = 3;

handles.training_input = [];
handles.training_output = [];
handles.test_input = [];
handles.test_output = [];

handles.network = [];%FIXME: We have a default network, set it here!!!
handles.networkName = [];%FIXME: Change this to have the default network name

%%%%
%% Hide plot!
%%%%
set(handles.axes1,'Visible','off');

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
    
    %%%%
    %% TODO:
    %% 1- Load Training File
    %% 2- Get Indexes of the Patient's Crysis
    %% 3- Get Train and Test Data
    %% 4- Train network
    %%%%
    
    %Load training file
    load(handles.training_file);
    
    %Get indexes of the patient's crysis
    crysis_indexes = getCrysisIndexes(Trg);
    
    %Get train and test data
    
    [handles.training_input, handles.training_output] = getTrainingData(crysis_indexes, Trg, FeatVectSel, handles.percentage_training);
    [handles.test_input, handles.test_output] = getTestData();    
    
    %Create desired network(Shouldn't be needed, should already have been created)
    %handles.network
    %handles.networkname
    
    %Train network
    %handles.network = 


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
    %% 4- Get Results and Plot them
    %%%%
    
    %Check if desired network is trained -> Compare with network name


% --- Executes on selection change in trainingDataListBox.
function trainingDataListBox_Callback(hObject, eventdata, handles)
% hObject    handle to trainingDataListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns trainingDataListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from trainingDataListBox

    contents = cellstr(get(hObject,'String'));
    handles.training_file = contents{get(hObject,'Value')};


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
    handles.goal


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



function hiddenLayersEdit_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenLayersEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hiddenLayersEdit as text
%        str2double(get(hObject,'String')) returns contents of hiddenLayersEdit as a double
    handles.hiddenLayers = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function hiddenLayersEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenLayersEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function layerDelaysEdit_Callback(hObject, eventdata, handles)
% hObject    handle to layerDelaysEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of layerDelaysEdit as text
%        str2double(get(hObject,'String')) returns contents of layerDelaysEdit as a double
    handles.layerDelays = str2double(get(hObject,'String'));

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
