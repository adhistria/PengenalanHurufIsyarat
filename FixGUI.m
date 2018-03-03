function varargout = FixGUI(varargin)
% FIXGUI MATLAB code for FixGUI.fig
%      FIXGUI, by itself, creates a new FIXGUI or raises the existing
%      singleton*.
%
%      H = FIXGUI returns the handle to a new FIXGUI or the handle to
%      the existing singleton*.
%
%      FIXGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIXGUI.M with the given input arguments.
%
%      FIXGUI('Property','Value',...) creates a new FIXGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FixGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FixGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FixGUI

% Last Modified by GUIDE v2.5 15-Jan-2018 09:27:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FixGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FixGUI_OutputFcn, ...
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


% --- Executes just before FixGUI is made visible.
function FixGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FixGUI (see VARARGIN)

% Choose default command line output for FixGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FixGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FixGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
global img
    % filename = uiputfile;
% if filename==0
%   % user pressed cancel
%   return

[filename pathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
if(filename == 0)
    
else
    img= imread(strcat(pathname, filename));
    img= imresize(img,[200 200]);
     handles.myImage = strcat(pathname, filename);
     axes(handles.input);
%      imshow(handles.myImage)
    imshow(img)
end
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in nilaiP.
function nilaiP_Callback(hObject, eventdata, handles)
handles.P=1;
global nilaiP
nilaiP=1
nilaiP= get(handles.nilaiP,'value')
guidata(hObject, handles);

% handels.P= get(handles.nilaiP,'value')
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
handles.R = 1
global nilaiR
nilaiR=1
nilaiR =get(handles.nilaiR,'value')
guidata(hObject, handles);
% handels.R= get(handles.nilaiR,'value')
% guidata(hObject,handles)
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


% --- Executes on selection change in pattern.
function pattern_Callback(hObject, eventdata, handles)
handles.PT=1;
global pattern
pattern=1
pattern =get(handles.pattern,'value')
guidata(hObject, handles);

% handels.pattern= get(handles.pattern,'value')
% guidata(hObject,handles)
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
% hObject    handle to btnEkstraksiCiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles = guidata( hObject, handles ); 
% change_handle( hObject, evendata, handles ); 
%    handles = guidata( hObject );
%    set( handles.text_field, 'String', num2str( handles.value_A ) ); 

% if(handles.nilaiP==1 ||handles.nilaiR==1||handles.pattern==1)
%     ed = errordlg('Pilih nilai P,R, dan Pattern','Error');
%     set(ed, 'WindowStyle', 'modal');
%     uiwait(ed);
% elseif(handles.nilaiP==4 && handles.nilaiR==2)
%     ed = errordlg('Nilai minimum R untuk P=16 ialah R=2','Error');
%     set(ed, 'WindowStyle', 'modal');
%     uiwait(ed);
% else
%     if(handles.nilaiP==2 && handles.pattern==2 )
%         [matriksLBP,hasilEkstraksiCiri] = lbp4(rgb2gray(img),nilaiR-1);
%     elseif(handles.nilaiP==2 && handles.pattern==3 )
%         [matriksLBP,~] = lbp4(rgb2gray(img),nilaiR-1);
%         hasilEkstraksiCiri = lbp4Uniform(rgb2gray(img),nilaiR-1);
%     elseif(handles.nilaiP==3 && handles.pattern==2)
%         [matriksLBP,hasilEkstraksiCiri] = lbp8(rgb2gray(img),nilaiR-1); 
%     elseif(handles.nilaiP==3 && handles.pattern==3 )
%         [matriksLBP,~] = lbp8(rgb2gray(img),nilaiR-1);
%         hasilEkstraksiCiri = lbp8Uniform(rgb2gray(img),nilaiR-1);
%     elseif(handles.nilaiP==4 && handles.pattern==2)
%         [matriksLBP,hasilEkstraksiCiri] = lbp16(rgb2gray(img),nilaiR-1); 
%     elseif(handles.nilaiP==3 && handles.pattern==3 )
%         [matriksLBP,~] = lbp16(rgb2gray(img),nilaiR-1);
%         hasilEkstraksiCiri = lbp16Uniform(rgb2gray(img),nilaiR-1);
%     end
%     axes(handles.ekstraksiCiri);
%     imshow(matriksLBP);
%     axes(handles.histogram);
%     bar(hasilEkstraksiCiri);
% end
global nilaiP nilaiR pattern img 
    
nilaiP
nilaiR
pattern
imgbaru = img;
% imgbaru = imresize(img,[200 200]);
if(nilaiP==1 ||nilaiR==1||pattern==1)
    ed = errordlg('Pilih nilai P,R, dan Pattern','Error');
    set(ed, 'WindowStyle', 'modal');
    uiwait(ed);
elseif(nilaiP==4 && nilaiR==2)
    ed = errordlg('Nilai minimum R untuk P=16 ialah R=2','Error');
    set(ed, 'WindowStyle', 'modal');
    uiwait(ed);
else
    svmModelName = 'svmModellbpP';
    if(nilaiP==2 && pattern==2 )
        [matriksLBP,hasilEkstraksiCiri] = lbp4(rgb2gray(imgbaru),nilaiR-1);
        nameFile=strcat(svmModelName,'4R',num2str(nilaiR-1),'.mat');
    elseif(nilaiP==2 && pattern==3 )
        [matriksLBP,~] = lbp4(rgb2gray(imgbaru),nilaiR-1);
        hasilEkstraksiCiri = lbp4Uniform(rgb2gray(imgbaru),nilaiR-1);
        nameFile=strcat(svmModelName,'4R',num2str(nilaiR-1),'Uniform.mat');
    elseif(nilaiP==3 && pattern==2)
        [matriksLBP,hasilEkstraksiCiri] = lbp8(rgb2gray(imgbaru),nilaiR-1); 
        nameFile=strcat(svmModelName,'8R',num2str(nilaiR-1),'.mat');
    elseif(nilaiP==3 && pattern==3 )
        [matriksLBP,~] = lbp8(rgb2gray(imgbaru),nilaiR-1);
        hasilEkstraksiCiri = lbp8Uniform(rgb2gray(imgbaru),nilaiR-1);
        nameFile=strcat(svmModelName,'8R',num2str(nilaiR-1),'Uniform.mat');
    elseif(nilaiP==4 && pattern==2)
        [matriksLBP,hasilEkstraksiCiri] = lbp16(rgb2gray(imgbaru),nilaiR-1); 
        nameFile=strcat(svmModelName,'16R',num2str(nilaiR-1),'.mat');
    elseif(nilaiP==4 && pattern==3 )
        [matriksLBP,~] = lbp16(rgb2gray(imgbaru),nilaiR-1);
        hasilEkstraksiCiri= lbp16Uniform(rgb2gray(imgbaru),nilaiR-1);
        size(hasilEkstraksiCiri)
        nameFile=strcat(svmModelName,'16R',num2str(nilaiR-1),'Uniform.mat')
        load(nameFile)
    end
    axes(handles.ekstraksiCiri);
    imshow(matriksLBP);
    axes(handles.histogram);
    bar(hasilEkstraksiCiri);
    load(nameFile)
    predictS = predict(svmModel,hasilEkstraksiCiri(1,:))
    
    predictB = predict(svmModel,hasilEkstraksiCiri)
    hrf = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    huruf = hrf(predictS);       
%     teks = strcat('Terprediksi Huruf  ',' ',huruf);
    set(handles.text4,'String',huruf);
end


% --- Executes on button press in prediksiBtn.
function prediksiBtn_Callback(hObject, eventdata, handles)
% hObject    handle to prediksiBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function prediksiTeks_Callback(hObject, eventdata, handles)
% hObject    handle to prediksiTeks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prediksiTeks as text
%        str2double(get(hObject,'String')) returns contents of prediksiTeks as a double


% --- Executes during object creation, after setting all properties.
function prediksiTeks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prediksiTeks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
