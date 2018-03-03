function varargout = guiTA(varargin)
% GUITA MATLAB code for guiTA.fig
%      GUITA, by itself, creates a new GUITA or raises the existing
%      singleton*.
%
%      H = GUITA returns the handle to a new GUITA or the handle to
%      the existing singleton*.
%
%      GUITA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITA.M with the given input arguments.
%
%      GUITA('Property','Value',...) creates a new GUITA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiTA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiTA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiTA

% Last Modified by GUIDE v2.5 15-Jan-2018 08:04:36

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiTA_OpeningFcn, ...
                   'gui_OutputFcn',  @guiTA_OutputFcn, ...
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


% --- Executes just before guiTA is made visible.
function guiTA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiTA (see VARARGIN)

% Choose default command line output for guiTA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiTA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiTA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% 
varargout{1} = handles.output;


% --- Executes on selection change in nilaiP.
function nilaiP_Callback(hObject, eventdata, handles)
% global nilaiP
handles.nilaiP = get(handles.nilaiP,'value');
% guidata(hObject,handles)

% hObject    handle to nilaiP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nilaiP contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nilaiP


% --- Executes during object creation, after setting all properties.
function nilaiP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nilaiR.
function nilaiR_Callback(hObject, eventdata, handles)
% global nilaiR
handles.nilaiR = get(handles.nilaiR,'value')
guidata(hObject,handles)

% hObject    handle to nilaiR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nilaiR contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nilaiR


% --- Executes during object creation, after setting all properties.
function nilaiR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% if((nilaiP== 1) || (nilaiP==2))
%     set(hObject,'String',{'R=1';'R=2';'R=3';'R=4';'R=5';'R=6';'R=7';'R=8';'R=9';'R=10'});
% else
%     set(hObject,'String',{'R=2';'R=3';'R=4';'R=5';'R=6';'R=7';'R=8';'R=9';'R=10'});
% end


% --- Executes on selection change in pattern.
function pattern_Callback(hObject, eventdata, handles)
% global pattern;
handles.pattern = get(handles.nilaiR,'value')
guidata(hObject,handles)
% hObject    handle to pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pattern contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pattern


% --- Executes during object creation, after setting all properties.
function pattern_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEkstraksiCiri.
function btnEkstraksiCiri_Callback(hObject, eventdata, handles)
handles = guidata( hObject, handles ); 
change_handle( hObject, evendata, handles ); 
   handles = guidata( hObject );
   set( handles.text_field, 'String', num2str( handles.value_A ) ); 

if(handles.nilaiP==1 ||handles.nilaiR==1||handles.pattern==1)
    ed = errordlg('Pilih nilai P,R, dan Pattern','Error');
    set(ed, 'WindowStyle', 'modal');
    uiwait(ed);
elseif(handles.nilaiP==4 && handles.nilaiR==2)
    ed = errordlg('Nilai minimum R untuk P=16 ialah R=2','Error');
    set(ed, 'WindowStyle', 'modal');
    uiwait(ed);
else
    if(handles.nilaiP==2 && handles.pattern==2 )
        [matriksLBP,hasilEkstraksiCiri] = lbp4(rbg2gray(img),nilaiR-1);
    elseif(handles.nilaiP==2 && handles.pattern==3 )
        [matriksLBP,~] = lbp4(rbg2gray(img),nilaiR-1);
        hasilEkstraksiCiri = lbp4Uniform(rbg2gray(img),nilaiR-1);
    elseif(handles.nilaiP==3 && handles.pattern==2)
        [matriksLBP,hasilEkstraksiCiri] = lbp8(rbg2gray(img),nilaiR-1); 
    elseif(handles.nilaiP==3 && handles.pattern==3 )
        [matriksLBP,~] = lbp8(rbg2gray(img),nilaiR-1);
        hasilEkstraksiCiri = lbp8Uniform(rbg2gray(img),nilaiR-1);
    elseif(handles.nilaiP==4 && handles.pattern==2)
        [matriksLBP,hasilEkstraksiCiri] = lbp16(rbg2gray(img),nilaiR-1); 
    elseif(handles.nilaiP==3 && handles.pattern==3 )
        [matriksLBP,~] = lbp16(rbg2gray(img),nilaiR-1);
        hasilEkstraksiCiri = lbp16Uniform(rbg2gray(img),nilaiR-1);
    end
    axes(handles.ekstraksiCiri);
    imshow(matriksLBP);
    axes(handles.histogram);
    bar(hasilEkstraksiCiri);
end
    
    
% hObject    handle to btnEkstraksiCiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function textPrediksi_Callback(hObject, eventdata, handles)
% hObject    handle to textPrediksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textPrediksi as text
%        str2double(get(hObject,'String')) returns contents of textPrediksi as a double


% --- Executes during object creation, after setting all properties.
function textPrediksi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textPrediksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [filename pathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
 global img;
 img=(strcat(pathname, filename));
 handles.myImage = strcat(pathname, filename);
 axes(handles.gambarInput);
 imshow(handles.myImage)
%  set(handles.edit1,'string',filename);
%  set(handles.edit2,'string',image);


% --- Executes during object deletion, before destroying properties.
