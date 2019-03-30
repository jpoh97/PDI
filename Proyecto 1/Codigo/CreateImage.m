%--------------------------------------------------------------------------
%------- Clase que crea una imagen apartir de un vídeo --------------------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Septiembre 25, 2017 ----------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 1. Inicializo el sistema ----------------------------------------------
%--------------------------------------------------------------------------

clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

%--------------------------------------------------------------------------
%-- 2. Leer el video e inicializar variables ------------------------------
%--------------------------------------------------------------------------

video = VideoReader('VID_20170915_175749.mp4'); % Se lee el video

largeImage = [];                                % Se inicializa la variable que
                                                % tendrá la imagen
rowSize = video.Height;                         % Obtengo la altura del video
halfRow = rowSize/2;                            % Obtengo altura de la mitad
k = 0;                                          % Variable contadora

%--------------------------------------------------------------------------
%-- 3. De cada frame, obtengo las 7 filas centrales -----------------------
%--------------------------------------------------------------------------

while hasFrame(video)                           % Por cada frame en el video
    img = readFrame(video);                     % Obtengo el frame
    % En la variable largeImage almaceno las 7 filas centrales de cada
    % frame, al final tendre una imagen de 7*numeroDeFrames
    largeImage = [largeImage; img(halfRow - 3 : halfRow + 3, :, :)];
    k = k + 1                                   % Imprimo por cada iteración 
                                                % para saber en donde voy
end                                             % Termina el ciclo

%--------------------------------------------------------------------------
%-- 4. Guardo imagen resultante, y la muestro -----------------------------
%--------------------------------------------------------------------------

imwrite(largeImage, 'image.jpg');       % Almaceno la imagen

figure(1);                              % Se crea la figura que la mostrara
imgAux = imresize(largeImage, 0.02);    % Muestro solo el 2% de la imagen,
                                        % debido a que es muy grande
imshow(imgAux);                         % Se muestra la imagen resultante
impixelinfo;                            % Muestro las componentes RGB que 
                                        % señale el cursor