%--------------------------------------------------------------------------
%------- Función que cuenta las motos -------------------------------------
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

function [newImg2, myFunction] = myCount()
    
    img = imread('sin_cebras.jpg');         % Leo imagen creada myCebra()

    ee=strel('square',6);                   % Creo elemento estructurante
    e=imdilate(img,ee);                     % Dilato la imagen para unir 
    e=imdilate(e,ee);                       % algunos elementos que no 
    e=imdilate(e,ee);                       % continuos
    e=imdilate(e,ee);

    BW2 = bwareaopen(e, 3800);              % Este metodo me permite eliminar
                                            % los elementos con un area
                                            % menor a 3800
    BW3 = BW2 - bwareaopen(e, 7000);        % De esta manera elimino los elementos
                                            % con area mayor a 7000
                                            % asumiendo que una moto tiene
                                            % un area entre 3800 y 7000
    [newImg2, myFunction] = bwlabel(BW3);   % Cuento los elementos que sobrevieron
                                            % los cuales corresponden a las
                                            % motos

    imwrite(newImg2, 'final.jpg');          % Guardo la imagen en final.jpg
end