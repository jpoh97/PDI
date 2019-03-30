%--------------------------------------------------------------------------
%------- Función que coge la imagen, elimina el gris del suelo, -----------
%------- y la pasa a escala de grises -------------------------------------
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

function myGray = myFunction2()
    
    a=imread('image.jpg');              % Se lee la imagen tomada del video
    [bw,b] = createMask_gris_1(a);      % Se llama la función que elimina 
                                        % el gris del piso
    a(repmat(bw,[1 1 3])) = 0;          % Replico la información en las 3 
                                        % capas para que quede en escala de
                                        % grises
    myGray = rgb2gray(a);               
    imwrite(myGray,'sin_gris.jpg');     % Escribo la imagen en un archivo 
                                        % llamado sin_gris.jpg
    
end