%--------------------------------------------------------------------------
%------- Clase en la cual se dilata la imagen -----------------------------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Septiembre 25, 2017 ----------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 13. Inicializo el sistema ---------------------------------------------
%--------------------------------------------------------------------------

clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

%--------------------------------------------------------------------------
%-- 14. Inicializo variables ----------------------------------------------
%--------------------------------------------------------------------------

img = imread('imageUmbral.jpg');    % Se lee la imagen creada en Umbral.m

ee = strel('square', 15);            % Defino mi elemento estructurante

%--------------------------------------------------------------------------
%-- 15. Dilato la imagen --------------------------------------------------
%--------------------------------------------------------------------------

for i=1:25                           % Repito 25 veces
    img = imdilate(img, ee);         % Dilato la imagen
end                                  % Fin del ciclo

%--------------------------------------------------------------------------
%-- 16. Almaceno y muestro imagen -----------------------------------------
%--------------------------------------------------------------------------

imwrite(img, 'imageDilate.jpg');    % Almaceno la imagen

figure(1);                          % Se crea la figura que la mostrara
imgAux = imresize(img, 0.02);       % Muestro solo el 2% de la imagen,
                                    % debido a que es muy grande
imshow(imgAux);                     % Se muestra la imagen resultante 
impixelinfo;                        % Muestro las componentes RGB que 
                                    % señale el cursor