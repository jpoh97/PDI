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

function [newImg2, myFunction] = myCount(img)
    
    %img = imread('dilate.jpg');         % Leo imagen creada myCebra()

%     ee=strel('square',6);                   % Creo elemento estructurante
%     e=imdilate(img,ee);                     % Dilato la imagen para unir 
%     e=imdilate(e,ee);                       % algunos elementos que no 
%     e=imdilate(e,ee);                       % continuos
%     e=imdilate(e,ee);
    
    %ee2=strel('line',500,30);
    
    %g=imerode(img,ee2);
        
    [gray, b] = createMask(img);
    dilate = myDilate(gray);
    
    BW2 = bwareaopen(dilate, 22000);              
                                            % Este metodo me permite eliminar
                                            % los elementos con un area
                                            % menor a 10000
    [newImg2, myFunction] = bwlabel(BW2);   % Cuento los elementos que sobrevieron
                                            % los cuales corresponden a las
                                            % motos                                            

    %imwrite(newImg2, 'final.jpg');          % Guardo la imagen en final.jpg
end



% CONTAR MOTOS POR EL ANCHO, ASÍ COMO SE HIZO CON LAS CEBRAS