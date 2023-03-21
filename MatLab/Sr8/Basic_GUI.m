function varargout = Basic_GUI(varargin)
% BASIC_GUI MATLAB code for Basic_GUI.fig
%      BASIC_GUI, by itself, creates a new BASIC_GUI or raises the existing
%      singleton*.
%
%      H = BASIC_GUI returns the handle to a new BASIC_GUI or the handle to
%      the existing singleton*.
%
%      BASIC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASIC_GUI.M with the given input arguments.
%
%      BASIC_GUI('Property','Value',...) creates a new BASIC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Basic_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Basic_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Basic_GUI

% Last Modified by GUIDE v2.5 25-Apr-2022 22:57:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Basic_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Basic_GUI_OutputFcn, ...
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


% --- Executes just before Basic_GUI is made visible.
function Basic_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Basic_GUI (see VARARGIN)

handles.peaks = peaks(35);
handles.membrane = membrane;
x1 = linspace(0, 1, 20);
x2 = linspace(0, 1, 20);
[X1, X2] = meshgrid(x1, x2);
handles.z = 1 - X1.^2 - X2.^2;

handles.currentData = handles.peaks;
surf(handles.currentData)

% Choose default command line output for Basic_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Basic_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Basic_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String'); 
val = get(hObject, 'Value');

switch(str{val})
    case 'Peaks'
        handles.currentData = handles.peaks;
    case 'Membrane'
        handles.currentData = handles.membrane;
    case 'Z'
        handles.currentData = handles.z;
end

guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Surf_btn.
function Surf_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Surf_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
surf(handles.currentData);

% --- Executes on button press in Mesh_btn.
function Mesh_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mesh(handles.currentData)

% --- Executes on button press in Contour_btn.
function Contour_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Contour_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contour(handles.currentData)
