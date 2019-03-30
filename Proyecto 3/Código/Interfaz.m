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

video = VideoReader('VIDEO.mp4');               % Se lee el video


%handle =  implay('VIDEO.mp4');
%handle.Parent.Position = [30 100 700 550];

% Le muestro un mensaje al usuario de que inicia el proceso
set( handles.TxtWait, 'string', 'Procesando video...' );
pause(0);

largeImage = [];                                % Se inicializa la variable que
                                                % tendrá la imagen
rowSize = video.Height;                         % Obtengo la altura del video
halfRow = rowSize/2;                            % Obtengo altura de la mitad
k = 0;                                          % Variable contadora
counter = 0;
s = 0;
str = '0';

while hasFrame(video)                           % Por cada frame en el video
    img = readFrame(video);                     % Obtengo el frame
    % En la variable largeImage almaceno las 7 filas centrales de cada
    % frame, al final tendre una imagen de 7*numeroDeFrames
    largeImage = [largeImage; img(halfRow - 3 : halfRow + 3, :, :)];
    if mod(k, 90) == 0
        
        %p = gcp();
        %countLargeImage = parfeval(p, @myCount,1,largeImage);        
        %aux = int16(fetchOutputs(countLargeImage));
        [newImg2, myFunction] = myCount(largeImage);
        counter = counter + myFunction;
        set( handles.TxtResult, 'string', num2str(counter));
        pause(0);
        largeImage = [];
        if myFunction ~= 0
            s = floor(k/30);
            str = [str, ', '];
            aux = s - 3;
            num = floor(aux/60);
            den = aux - 60*num;            
            if den < 0
                s
                s/60
                num
                floor(s/60)
            end
            str = [str,num2str(num),':',num2str(den)];            
            num = floor(s/60);
            den = s - 60*num;
            str = [str,' - ',num2str(num),':',num2str(den)];
            set( handles.minutes, 'string', {str});
            pause(0);
        end
    end
    k = k + 1;                                   % Imprimo por cada iteración 
                                                % para saber en donde voy
end                                             % Termina el ciclo

[newImg2, myFunction] = myCount(largeImage);
counter = counter + myFunction;
set( handles.TxtResult, 'string', num2str(counter));
pause(0);

% Muestro un texto que diga que el programa ha finalizado
set( handles.TxtWait, 'string', 'TERMINADO' );

InterfazFinal;