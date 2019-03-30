%--------------------------------------------------------------------------
%------- Función que elimina la cebra peatonal ----------------------------
%--------------------------------------------------------------------------
%------- Por: Sergio Alonso Marriaga Rivera -------------------------------
%-------      CC 1020462834, sergio.marriaga@udea.edu.co ------------------
%------- Por: Juan Pablo Ospina Herrera -----------------------------------
%-------      CC 1152707477, juan.ospina3@udea.edu.co ---------------------
%--------------------------------------------------------------------------
%------- Octubre 29, 2017 -------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%-- 1. Declaro la función -------------------------------------------------
%--------------------------------------------------------------------------

function myCebra = myFunction4()
    
    f=imread('dilate.jpg');             % Leo la imagen binarizada
    ee=strel('line',120,0);             % Creo un elemento estructurante de
                                        % una linea con ancho 120
    g=imerode(f,ee);                    % Todo elemento que tenga un ancho 
                                        % menor a 120 se elimina, ya que
                                        % una moto es más ancha que la
                                        % cebra peatonal
    imwrite(g,'sin_cebras.jpg');        % Guardo la imagen resultante
    myCebra = g;                        % Retorno la imagen resultante
    
end

