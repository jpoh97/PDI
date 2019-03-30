%--------------------------------------------------------------------------
%------- Clase en la cual se segmenta y se obtiene el número de taxis -----
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Septiembre 25, 2017 ----------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 17. Inicializo el sistema ---------------------------------------------
%--------------------------------------------------------------------------

clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

%--------------------------------------------------------------------------
%-- 18. Inicializo variables ----------------------------------------------
%--------------------------------------------------------------------------

img = imread('imageDilate.jpg');    % Se lee la imagen creada en Dilate.m

imgAux = rgb2gray(img);             % Se pasa la imagen a escala de grises

%--------------------------------------------------------------------------
%-- 19. Defino otro umbral para el gris -----------------------------------
%--------------------------------------------------------------------------

imgAux(imgAux < 200) = 0;           % Los pixeles con menos gris, los vuelvo 0
imgAux(imgAux > 0) = 255;           % El resto 255

%--------------------------------------------------------------------------
%-- 20. Segmento la imagen ------------------------------------------------
%--------------------------------------------------------------------------

[l, n] = bwlabel(imgAux);           % Obtengo la imagen en l con etiquetas, 
                                    % en n se almacena el número de segmentos

%--------------------------------------------------------------------------
%-- 21. Almaceno y muestro imagen -----------------------------------------
%--------------------------------------------------------------------------

figure(1);                          % Se crea la figura que la mostrara
imgAux2 = imresize(l, 0.02);        % Muestro solo el 2% de la imagen,
                                    % debido a que es muy grande
imshow(imgAux2);                     % Se muestra la imagen con etiquetas 
impixelinfo;                        % Muestro los segmentos que tiene a medida 
                                    % que señale con el cursor

%--------------------------------------------------------------------------
%-- 22. Imprimo el resultado ----------------------------------------------
%--------------------------------------------------------------------------

n                                  % Corresponde al número de segmentos que
                                   % a su vez corresponde al número de
                                   % taxis que pasan. Esta es la respuesta
                                   % esperada