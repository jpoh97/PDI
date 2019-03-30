%--------------------------------------------------------------------------
%------- Interfaz donde se le muestra al usuario todo el procesamiento ----
%------- se esta aplicando a la imagen creada -----------------------------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Octubre 29, 2017 -------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 1. Función inicial de  la interfaz ------------------------------------
%--------------------------------------------------------------------------
function varargout = Interfaz(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaz_OutputFcn, ...
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


%--------------------------------------------------------------------------
%-- 2. Función que se ejecuta cuando es visible el layout -----------------
%--------------------------------------------------------------------------
function Interfaz_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for Interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.axes4);
imshow('image.jpg');

axes(handles.axes5);
imshow('sin_gris.jpg');

axes(handles.axes7);
imshow('dilate.jpg');

axes(handles.axes8);
imshow('final.jpg');

str = '';
num = floor(14*100/15);

str = [num2str(num), '%'];

set( handles.TxtResult, 'string', str);

pause(0);


%--------------------------------------------------------------------------
%-- 3. Función generada por matlab ----------------------------------------
%--------------------------------------------------------------------------
function varargout = Interfaz_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
