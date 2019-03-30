%--------------------------------------------------------------------------
%------- Clase que lee la imagen creada, y realiza open -------------------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Septiembre 25, 2017 ----------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 5. Inicializo el sistema ----------------------------------------------
%--------------------------------------------------------------------------

clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

%--------------------------------------------------------------------------
%-- 6. Inicializo variables -----------------------------------------------
%--------------------------------------------------------------------------

img = imread('image.jpg');  % Leo la imagen creada en la clase CreateImage.m
ee = strel('square', 15);   % Creo mi elemento estructurante

imgAux = imopen(img, ee);   % Realizo una apertura para para eliminar 
                            % objetos geométricamente pequeños de una imagen

%--------------------------------------------------------------------------
%-- 7. Elimino objetos pequeños -------------------------------------------
%--------------------------------------------------------------------------

for i=1:30                          % Recorro 30 veces
    imgAux = imopen(imgAux, ee);    % Por cada iteración aplico una apertura
end                                 % Termina ciclo

%--------------------------------------------------------------------------
%-- 8. Almaceno y muestro imagen ------------------------------------------
%--------------------------------------------------------------------------

imwrite(imgAux, 'imageOpen.jpg');   % Almaceno la imagen

figure(1);                          % Se crea la figura que la mostrara
imgAux = imresize(imgAux, 0.02);    % Muestro solo el 2% de la imagen,
                                    % debido a que es muy grande
imshow(imgAux);                     % Se muestra la imagen resultante 
impixelinfo;                        % Muestro las componentes RGB que 
                                    % señale el cursor