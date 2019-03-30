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

%--------------------------------------------------------------------------
%-- 3. Función generada por matlab ----------------------------------------
%--------------------------------------------------------------------------
function varargout = Interfaz_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


%--------------------------------------------------------------------------
%-- 4. Callback (función) que se llama al presionar el boton --------------
%--------------------------------------------------------------------------
function pushbutton2_Callback(hObject, eventdata, handles)

% Le muestro un mensaje al usuario de que inicia el proceso
set( handles.TxtWait, 'string', 'Espere un momento por favor...' );
pause(1);

% Muestro la imagen en escala de grises, eliminando el suelo
axes(handles.axes4);
imshow(myGray());
pause(0);

% Muestro la imagen después de haberla dilata unas cuantas veces
axes(handles.axes5);
imshow(myDilate());
pause(0);

% Muestro la imagen si la cebra peatonal
axes(handles.axes7);
imshow(myCebra());
pause(0);

% Le muestro al usuario que inicia el conteo de motos
set( handles.TxtWait, 'string', 'Contando motos...' );
pause(1);

% Muestro la imagen final desde la cual se realizo el conteo
[newImg2, myFunction] = myCount();
axes(handles.axes8);
imshow(newImg2);

% Muestro el total de motos en el label de resultados
set( handles.TxtResult, 'string', num2str(myFunction));

% Muestro un texto que diga que el programa ha finalizado
set( handles.TxtWait, 'string', 'TERMINADO' );
