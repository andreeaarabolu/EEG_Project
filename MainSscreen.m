function varargout = MainSscreen(varargin)
% MAINSSCREEN MATLAB code for MainSscreen.fig
%      MAINSSCREEN, by itself, creates a new MAINSSCREEN or raises the existing
%      singleton*.
%
%      H = MAINSSCREEN returns the handle to a new MAINSSCREEN or the handle to
%      the existing singleton*.
%
%      MAINSSCREEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINSSCREEN.M with the given input arguments.
%
%      MAINSSCREEN('Property','Value',...) creates a new MAINSSCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainSscreen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainSscreen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainSscreen

% Last Modified by GUIDE v2.5 15-Aug-2019 02:54:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainSscreen_OpeningFcn, ...
                   'gui_OutputFcn',  @MainSscreen_OutputFcn, ...
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




% --- Executes just before MainSscreen is made visible.
function MainSscreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainSscreen (see VARARGIN)

% Choose default command line output for MainSscreen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainSscreen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainSscreen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in servo1_disp.
function servo1_disp_Callback(hObject, eventdata, handles)
% hObject    handle to servo1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo1_disp
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo2_disp.
function servo2_disp_Callback(hObject, eventdata, handles)
% hObject    handle to servo2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo2_disp
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo3_disp.
function servo3_disp_Callback(hObject, eventdata, handles)
% hObject    handle to servo3_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo3_disp
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo4_disp.
function servo4_disp_Callback(hObject, eventdata, handles)
% hObject    handle to servo4_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo4_disp
global ard;
sendMessageToArd(handles,ard);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over servo2_disp.
function servo2_disp_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to servo2_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on servo2_disp and none of its controls.
function servo2_disp_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to servo2_disp (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over servo1_disp.
function servo1_disp_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to servo1_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in porneste.
function porneste_Callback(hObject, eventdata, handles)
% hObject    handle to porneste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ard;
sendMessageToArd(handles,ard);
% Hint: get(hObject,'Value') returns toggle state of porneste


% --- Executes on button press in repaus.
function repaus_Callback(hObject, eventdata, handles)
% hObject    handle to repaus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ard;
sendMessageToArd(handles,ard);
% Hint: get(hObject,'Value') returns toggle state of repaus


% --------------------------------------------------------------------
function uibuttongroup1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in manual.
function manual_Callback(hObject, eventdata, handles)
% hObject    handle to manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ard;
sendMessageToArd(handles,ard);
% Hint: get(hObject,'Value') returns toggle state of manual
checkboxState = get(hObject,'Value');

if(checkboxState == 1)
    if (handles.servo1_disp.Value == 1)
        handles.servo1_sel.Enable = 'On';
    end
    if (handles.servo2_disp.Value == 1)
        handles.servo2_sel.Enable = 'On';
    end
    if (handles.servo3_disp.Value == 1)
        handles.servo3_sel.Enable = 'On';
    end
    if (handles.servo4_disp.Value == 1)
        handles.servo4_sel.Enable = 'On';
    end
    
    handles.repaus.Enable = 'On';
    handles.porneste.Enable = 'On';
end
% disp(checkboxState);


% --- Executes on button press in servo2_sel.
function servo2_sel_Callback(hObject, eventdata, handles)
% hObject    handle to servo2_sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo2_sel
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo1_sel.
function servo1_sel_Callback(hObject, eventdata, handles)
% hObject    handle to servo1_sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo1_sel
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo3_sel.
function servo3_sel_Callback(hObject, eventdata, handles)
% hObject    handle to servo3_sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo3_sel
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in servo4_sel.
function servo4_sel_Callback(hObject, eventdata, handles)
% hObject    handle to servo4_sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of servo4_sel
global ard;
sendMessageToArd(handles,ard);

% --- Executes on button press in eeg_sig.
function eeg_sig_Callback(hObject, eventdata, handles)
% hObject    handle to eeg_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of eeg_sig
global ard;
sendMessageToArd(handles,ard);

checkboxState = get(hObject,'Value');

if(checkboxState == 1)
    handles.servo1_sel.Enable = 'off';
    handles.servo2_sel.Enable = 'off';
    handles.servo3_sel.Enable = 'off';
    handles.servo4_sel.Enable = 'off';
    
    handles.repaus.Enable = 'off';
    handles.porneste.Enable = 'off';
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of start

checkboxState = get(hObject,'Value');
global go;

if(checkboxState == 1)
    handles.eeg_sig.Enable = 'On';
    handles.manual.Enable = 'On';
    go = 1;
end

if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
end
    
global ard;
ard=serial('COM5','BaudRate',9600);
fopen(ard);

sendMessageToArd(handles,ard);

T=25;
t=1;
signal = 0;


while (go == 1)
    s = fscanf(ard, '%s');
    
    disp('Mesaj primit de la ard: ');
    disp(s);
    
    if (~isempty(s) && char(s(1)) == '!') %verificam inceperea unui nou pachet de date
        if (str2num(s(2)) == 1)
            handles.reset.Enable = 'On';
            drawnow
        else
            if (str2num(s(3)) == 1)
                handles.quality.Enable = 'On';
                drawnow
            else
                handles.reset.Enable = 'off';
                handles.quality.Enable = 'off';
                drawnow

                value = str2num(s(4))*100 + str2num(s(5))*10 + str2num(s(6));

                signal = [signal value];
                plot(signal);
                axis([T*fix(t/T),T+T*fix(t/T),0,100]); 
                grid
                t=t+1;
                drawnow;
            end

        end
    end
end




% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stop
checkboxState = get(hObject,'Value');
global go;

if(checkboxState == 1)
    handles.eeg_sig.Enable = 'off';
    handles.manual.Enable = 'off';
    go = 0;
    cla(handles.mind_plot,'reset');
    if ~isempty(instrfind)
      fclose(instrfind);
      delete(instrfind);
    end
    drawnow
end


% --- Executes during object creation, after setting all properties.
function mind_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mind_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate mind_plot


% --- Executes during object creation, after setting all properties.
function uibuttongroup5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup5.
function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function adjust_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function reset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function quality_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ppp.
function ppp_Callback(hObject, eventdata, handles)
% hObject    handle to ppp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
