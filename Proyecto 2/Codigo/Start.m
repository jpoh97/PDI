%--------------------------------------------------------------------------
%------- Interfaz inicial del sistema en la cual se visualiza el video ----
%------- creación de la imagen resultante del video -----------------------
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

function varargout = Start(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Start_OpeningFcn, ...
                   'gui_OutputFcn',  @Start_OutputFcn, ...
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
function Start_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);


%--------------------------------------------------------------------------
%-- 3. Función generada por matlab ----------------------------------------
%--------------------------------------------------------------------------
function varargout = Start_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


%--------------------------------------------------------------------------
%-- 4. Callback (función) que se llama al presionar el boton --------------
%--------------------------------------------------------------------------
function BtnStart_Callback(hObject, eventdata, handles)

video = VideoReader('VIDEO.MOV');               % Se lee el video

largeImage = [];                                % Se inicializa la variable que
                                                % tendrá la imagen
rowSize = video.Height;                         % Obtengo la altura del video
halfRow = rowSize/2;                            % Obtengo altura de la mitad
k = 0;                                          % Variable contadora

while hasFrame(video)                           % Por cada frame en el video
    img = readFrame(video);                     % Obtengo el frame    
    
    axes(handles.myAxes2);                      % Donde muestro el video
    imshow(img);                                % Lo muestro
   
    % En la variable largeImage almaceno las 7 filas centrales de cada
    % frame, al final tendre una imagen de 7*numeroDeFrames
    largeImage = [largeImage; img(halfRow - 3 : halfRow + 3, :, :)];
    k = k + 1                                   % Imprimo por cada iteración     
    
    axes(handles.largeAxes2);                   % Donde muestro la imagen
    imshow(largeImage);                         % La muestro
    
    % Debido a que son al rededor de 8000 frames, el rendimiento del
    % sistema se ve afectado cuando pasa los 500 frames, ya que la imagen a
    % mostrar es muy larga y le cuesta tiempo mostrarla, así que apartir
    % del frame 500 muestra cada 10 frames
    if k > 500      
        if mod(k, 10) == 0
            pause(0);                           % La pausa es necesario para
        end                                     % que se visualice la imagen
    else
        pause(0);
    end
end           

imwrite(largeImage, 'image.jpg');               % Almaceno la imagen

Interfaz;                                       % Llamo la siguiente interfaz
                                                % donde proceso la imagen
                                                % creada

%handle = implay('IMG_9068.MOV');
%handle.Parent.Position = [0 100 700 550];
