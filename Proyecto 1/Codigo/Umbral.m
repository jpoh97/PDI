%--------------------------------------------------------------------------
%------- Clase en la cual se busca dejar solo los pixeles amarillos -------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Septiembre 25, 2017 ----------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 9. Inicializo el sistema ----------------------------------------------
%--------------------------------------------------------------------------

clear all   % Inicializa todas las variables
close all   % Cierra todas las ventanas, archivos y procesos abiertos
clc         % Limpia la ventana de comandos

%--------------------------------------------------------------------------
%-- 10. Inicializo variables ----------------------------------------------
%--------------------------------------------------------------------------

img = imread('imageOpen.jpg');          % Leo la imagen creada en ReadImage.m

%--------------------------------------------------------------------------
%-- 11. Defino un umbral --------------------------------------------------
%--------------------------------------------------------------------------

% A los pixeles donde los colores no sean fuertes, se les asigna 0, en caso
% contrario, se les asigana 255
img(img < 180) = 0; img(img > 0) = 255; 

% Recorro la imagen para borrar el blanco y los pixeles que son solo rojos,
% recordemos que el amarillo es rojo + verde
for i = 1:21112                         % Por cada fila
    for j = 1:1280                      % Por cada columna
        if img(i,j,1) > 215             % Si R = 255
            if img(i,j,2) == 255        % Si G = 255
                if img(i,j,3) == 255    % Si B = 255
                    img(i,j,:) = 0;     % Elimino los pixeles blancos
                end
            end            
        end
    
        if img(i,j,3) > 0               % Si hay pixeles azules
            img(i,j,:) = 0;             % Elimino los pixeles azules
        end
        if img(i,j,2) > 225             % Si hay mucho verde
            if img(i,j,1) < 50          % Y poco rojo
                img(i,j,:) = 0;         % Elimino los pixeles verdes
            end
        end
        if img(i,j,2) < 220             % Si hay muy poco verde, entonces
             img(i,j,:) = 0;            % Elimino los pixeles rojos
         end
    end
end

%--------------------------------------------------------------------------
%-- 12. Almaceno y muestro imagen -----------------------------------------
%--------------------------------------------------------------------------

imwrite(img, 'imageUmbral.jpg');    % Almaceno la imagen

figure(1);                          % Se crea la figura que la mostrara
imgAux = imresize(img, 0.02);       % Muestro solo el 2% de la imagen,
                                    % debido a que es muy grande
imshow(imgAux);                     % Se muestra la imagen resultante 
impixelinfo;                        % Muestro las componentes RGB que 
                                    % señale el cursor