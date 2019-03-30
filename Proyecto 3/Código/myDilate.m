%--------------------------------------------------------------------------
%------- Función que toma la imagen en escala de grises y la dilata -------
%------- para unir elementos que quedan separados y son el mismo ----------
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

function myDilate = myFunction3(d)
    
    %d=imread('sin_gris.jpg');           % Leo la imagen creada en myGray()
    ee=strel('square',6);               % Creo mi elemento estructurante
    e=imdilate(d,ee);                   % Dilato la imagen 4 veces ya que 
    e=imdilate(d,ee);                   % algunos elementos quedan separados
    e=imdilate(d,ee);                   % apesar de ser el mismo
    e=imdilate(d,ee);    
    f=e;                                
    f(f>0)=255;                         % Binarizo la imagen
    %imwrite(f,'dilate.jpg');            % Guardo la imagen en este formato
    myDilate = f;                       % Retorno la imagen generada
    
end