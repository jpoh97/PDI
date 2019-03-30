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
    [myGray,b] = createMask(a);         % Se llama la función que elimina 
                                        % el gris del piso
    imwrite(myGray,'sin_gris.jpg');         % Escribo la imagen en un archivo 
                                        % llamado sin_gris.jpg
    
end