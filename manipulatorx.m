function varargout = manipulatorx(varargin)
% MANIPULATORX MATLAB code for manipulatorx.fig
%      MANIPULATORX, by itself, creates a new MANIPULATORX or raises the existing
%      singleton*.
%
%      H = MANIPULATORX returns the handle to a new MANIPULATORX or the handle to
%      the existing singleton*.
%
%      MANIPULATORX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANIPULATORX.M with the given input arguments.
%
%      MANIPULATORX('Property','Value',...) creates a new MANIPULATORX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manipulatorx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manipulatorx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manipulatorx

% Last Modified by GUIDE v2.5 19-Dec-2022 19:26:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manipulatorx_OpeningFcn, ...
                   'gui_OutputFcn',  @manipulatorx_OutputFcn, ...
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


% --- Executes just before manipulatorx is made visible.
function manipulatorx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manipulatorx (see VARARGIN)

% Choose default command line output for manipulatorx
handles.output = hObject;
clc
default(handles);
sliderValue_theta1 = get(handles.slider_theta1,'Value');
set(handles.edit_theta1,'String',sliderValue_theta1);
sliderValue_theta2 = get(handles.slider_theta2,'Value');
set(handles.edit_theta2,'String',sliderValue_theta2);
sliderValue_theta3 = get(handles.slider_theta3,'Value');
set(handles.edit_theta3,'String',sliderValue_theta3);
sliderValue_theta4 = get(handles.slider_theta4,'Value');
set(handles.edit_theta4,'String',sliderValue_theta4);
cla(handles.axes_p,'reset');
set(handles.axes_p,'visible','off');
%
cla(handles.axes_v,'reset');
set(handles.axes_v,'visible','off');
%
cla(handles.axes_a,'reset');
set(handles.axes_a,'visible','off');
%
set(handles.graph,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manipulatorx wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manipulatorx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    
    theta1_max=180;
    theta1_min=-180;
    set(handles.slider_theta1, 'Max', theta1_max);
    set(handles.slider_theta1, 'Min', theta1_min);
    set(handles.slider_theta1, 'SliderStep' , [1/(theta1_max-1) , 10/(theta1_max-1)]);
    sliderValue_theta1 = get(handles.slider_theta1,'Value');
    set(handles.edit_theta1,'String',sliderValue_theta1)
    Forward_kinematic(handles)

% --- Executes during object creation, after setting all properties.
function slider_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    theta2_max=90;
    theta2_min=-117;
    set(handles.slider_theta2, 'Max', theta2_max);
    set(handles.slider_theta2, 'Min', theta2_min);
    set(handles.slider_theta2, 'SliderStep' , [1/(theta2_max-1) , 10/(theta2_max-1)]);
    sliderValue_theta2 = get(handles.slider_theta2,'Value');
    set(handles.edit_theta2,'String',sliderValue_theta2)
    Forward_kinematic(handles)

% --- Executes during object creation, after setting all properties.
function slider_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    theta3_max=180;
    theta3_min=-27;
    set(handles.slider_theta3, 'Max', theta3_max);
    set(handles.slider_theta3, 'Min', theta3_min);
    set(handles.slider_theta3, 'SliderStep' , [1/(theta3_max-1) , 10/(theta3_max-1)]);
    sliderValue_theta3 = get(handles.slider_theta3,'Value');
    set(handles.edit_theta3,'String',sliderValue_theta3)
    Forward_kinematic(handles)

% --- Executes during object creation, after setting all properties.
function slider_theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    theta4_max=103;
    theta4_min=-114;
    set(handles.slider_theta4, 'Max', theta4_max);
    set(handles.slider_theta4, 'Min', theta4_min);
    set(handles.slider_theta4, 'SliderStep' , [1/(theta4_max-1) , 10/(theta4_max-1)]);
    sliderValue_theta4 = get(handles.slider_theta4,'Value');
    set(handles.edit_theta4,'String',sliderValue_theta4)
    Forward_kinematic(handles)

% --- Executes during object creation, after setting all properties.
function slider_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta1 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta2 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta2 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta3 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta3 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta4 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta4 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_coor0.
function checkbox_coor0_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_coor0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_coor0
Forward_kinematic(handles);

% --- Executes on button press in checkbox_coor1.
function checkbox_coor1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_coor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_coor1
Forward_kinematic(handles);

% --- Executes on button press in checkbox_coor2.
function checkbox_coor2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_coor2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_coor2
Forward_kinematic(handles);

% --- Executes on button press in checkbox_coor3.
function checkbox_coor3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_coor3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_coor3
Forward_kinematic(handles);

% --- Executes on button press in checkbox_coor4.
function checkbox_coor4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_coor4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_coor4
Forward_kinematic(handles);

% --- Executes on slider movement.
function slider_opacity_Callback(hObject, eventdata, handles)
% hObject    handle to slider_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Forward_kinematic(handles);

% --- Executes during object creation, after setting all properties.
function slider_opacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_opacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function default(handles)
set(handles.edit_theta1,'string',num2str(0));
set(handles.edit_theta2,'string',num2str(0));
set(handles.edit_theta3,'string',num2str(0));
set(handles.edit_theta4,'string',num2str(0));
handles.slider_opacity.Value=1;
Forward_kinematic(handles);


% --- Executes on button press in push_forward.
function push_forward_Callback(hObject, eventdata, handles)
% hObject    handle to push_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Forward_kinematic(handles);

% --- Executes on button press in push_home.
function push_home_Callback(hObject, eventdata, handles)
% hObject    handle to push_home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
default(handles);



function edit_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x as text
%        str2double(get(hObject,'String')) returns contents of edit_x as a double


% --- Executes during object creation, after setting all properties.
function edit_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y as text
%        str2double(get(hObject,'String')) returns contents of edit_y as a double


% --- Executes during object creation, after setting all properties.
function edit_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z as text
%        str2double(get(hObject,'String')) returns contents of edit_z as a double


% --- Executes during object creation, after setting all properties.
function edit_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_roll_Callback(hObject, eventdata, handles)
% hObject    handle to edit_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_roll as text
%        str2double(get(hObject,'String')) returns contents of edit_roll as a double


% --- Executes during object creation, after setting all properties.
function edit_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yaw as text
%        str2double(get(hObject,'String')) returns contents of edit_yaw as a double


% --- Executes during object creation, after setting all properties.
function edit_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_x_Callback(hObject, eventdata, handles)
% hObject    handle to display_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_x as text
%        str2double(get(hObject,'String')) returns contents of display_x as a double


% --- Executes during object creation, after setting all properties.
function display_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_y_Callback(hObject, eventdata, handles)
% hObject    handle to display_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_y as text
%        str2double(get(hObject,'String')) returns contents of display_y as a double


% --- Executes during object creation, after setting all properties.
function display_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_z_Callback(hObject, eventdata, handles)
% hObject    handle to display_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_z as text
%        str2double(get(hObject,'String')) returns contents of display_z as a double


% --- Executes during object creation, after setting all properties.
function display_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_roll_Callback(hObject, eventdata, handles)
% hObject    handle to display_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_roll as text
%        str2double(get(hObject,'String')) returns contents of display_roll as a double


% --- Executes during object creation, after setting all properties.
function display_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to display_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_pitch as text
%        str2double(get(hObject,'String')) returns contents of display_pitch as a double


% --- Executes during object creation, after setting all properties.
function display_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function display_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to display_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display_yaw as text
%        str2double(get(hObject,'String')) returns contents of display_yaw as a double


% --- Executes during object creation, after setting all properties.
function display_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_inverse.
function push_inverse_Callback(hObject, eventdata, handles)
% hObject    handle to push_inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inverse_kinematic(handles);



function edit_x1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x1 as text
%        str2double(get(hObject,'String')) returns contents of edit_x1 as a double


% --- Executes during object creation, after setting all properties.
function edit_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_x2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x2 as text
%        str2double(get(hObject,'String')) returns contents of edit_x2 as a double


% --- Executes during object creation, after setting all properties.
function edit_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y1 as text
%        str2double(get(hObject,'String')) returns contents of edit_y1 as a double


% --- Executes during object creation, after setting all properties.
function edit_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y2 as text
%        str2double(get(hObject,'String')) returns contents of edit_y2 as a double


% --- Executes during object creation, after setting all properties.
function edit_y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_z1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z1 as text
%        str2double(get(hObject,'String')) returns contents of edit_z1 as a double


% --- Executes during object creation, after setting all properties.
function edit_z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_z2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z2 as text
%        str2double(get(hObject,'String')) returns contents of edit_z2 as a double


% --- Executes during object creation, after setting all properties.
function edit_z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pitch1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitch1 as text
%        str2double(get(hObject,'String')) returns contents of edit_pitch1 as a double


% --- Executes during object creation, after setting all properties.
function edit_pitch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pitch2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitch2 as text
%        str2double(get(hObject,'String')) returns contents of edit_pitch2 as a double


% --- Executes during object creation, after setting all properties.
function edit_pitch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pmax as text
%        str2double(get(hObject,'String')) returns contents of edit_pmax as a double


% --- Executes during object creation, after setting all properties.
function edit_pmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_trajec.
function push_trajec_Callback(hObject, eventdata, handles)
% hObject    handle to push_trajec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes_p,'visible','on');
set(handles.axes_v,'visible','on');
set(handles.axes_a,'visible','on');
set(handles.graph,'visible','on');
Trajectory(handles);

function edit_vmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vmax as text
%        str2double(get(hObject,'String')) returns contents of edit_vmax as a double


% --- Executes during object creation, after setting all properties.
function edit_vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_amax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amax as text
%        str2double(get(hObject,'String')) returns contents of edit_amax as a double


% --- Executes during object creation, after setting all properties.
function edit_amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_close.
function push_close_Callback(hObject, eventdata, handles)
% hObject    handle to push_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes_p,'reset');
set(handles.axes_p,'visible','off');
%
cla(handles.axes_v,'reset');
set(handles.axes_v,'visible','off');
%
cla(handles.axes_a,'reset');
set(handles.axes_a,'visible','off');
%
set(handles.graph,'visible','off');


% --- Executes on button press in checkbox_workspace.
function checkbox_workspace_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_workspace
Forward_kinematic(handles);
