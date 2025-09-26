%% MATRIZ DE TRASLACIÓN 

syms dx

close all; clear all; clc

syms dx dy dz real 
tras=[1 0 0 dx;...
   0 1 0 dy;...
   0 0 1 dz;...
   0 0 0 1]

%%  le damos a dx = 3 

dx =3, dy=2, dz=-4

tras= eval (tras)


%% 
p=[1 1 1 1]'

p1= tras*p

%% el origen donde está? del sistema desplazado

por=[0 0 0 1]'

po= tras*por

%% calcular la inversa de la matriz tarns para calcular donde está el origen del otro sistema que era primario, y pasa a ser secundario

intras = inv(tras)

pk=[0 0 0 1]' % Para saber donde está el origen 

%% La interpretaciòn de la matriz sirve para poder referenciar puntos en distintos sistemas de coordenadas. Siempre y cuando los sistemas de coordenadas sean de 
%Dextrógido 

intras*pk

%% Punto expresado en varios sistemas 
%roración en el eje Y


close all; clear all; clc

syms beta

beta= pi/2

roty=[cos(beta) 0 sin(beta)  0;...
   0 1 0 0;...
   -sin(beta) 0 cos(beta) 0;...
   0 0 0 1]

%%

p=[3 4 2 1]'

pp = roty*p

%% el origen donde esta?

por=[0 0 0 1]'

po = roty*por


%% representación de un punto en el espacio por dos sistemas de coordenadas distintos ***************
% del powerpoint de clase 
%
%
close all; clear all; clc

%ROTACIÓN EN EL EJE Z

syms gama;

gama= pi/2; % 90 GRADOS

rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]

%% MATRIZ DE TRASLACIÓN 

syms dx

trax=[1 0 0 1;...
   0 1 0 2;...
   0 0 1 3;...
   0 0 0 1]

%%  

p=[1 1 1 1]'

%%


H=trax*rotz % sabemos que el producto de matrices no es conmutativo ni el concepto que representa tampoco


%%


p1=H*p

%% ¿a que distancia del origen considerado fijo se encuentra el origen del sistema rotado y trasladado?


p2=[0 0 0 1]'; % claro el origen del sistema rotado y trasladado también es un punto el (0 0 0 1)
po= trax*rotz*p2

%% Definimos la matiz de rotaciòn.
close all; clear all; clc

syms gama;

gama= -pi/2; % -90 GRADOS

rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]

%% Multiplicar matriz evaluada de rotaciòn en Z * el punto R 

p0 = [4 8 12 1]'

tras=rotz*p0

%% problema rotación seguida de traslación pagina 9 del pdf pailos. Composición de matrices H.

%rotación en X
close all; clear all; clc
syms alfa

alfa= pi/2 ;

rotx=[1 0 0 0;...
   0 cos(alfa) -sin(alfa) 0;...
   0 sin(alfa) cos(alfa) 0;...
   0 0 0 1]

%% Traslado p(8,4,12)

tras=[1 0 0 8;...
   0 1 0 4;...
   0 0 1 12;...
   0 0 0 1]

%% Definiendo el vector r respecto al eje trasladado
h=tras*rotx
r=[-3 4 -11 1]'
%%
invtras=inv(h)

%%
invtras*r

%% problema avion *************************************************************************
close all; clear all; clc


% hacerlo 


%% MATRIZ DE TRASLACIÓN 

syms dx

trax=[1 0 0 3000;...
   0 1 0 5000;...
   0 0 1 350;...
   0 0 0 1]

%%  

p=[3 5 10 1]'


%%

p1=(trax*rotz)*p % 

%%
% a donde se encuentra el sistema de tierra considerando el fijo al avión y
% el modificado a la tierra

A= inv (trax*rotz)

%%
p3= A*[3000 5000 350 1]'




%% ejemplo 3.4  del libro de Barrientos pagina 71


%rotación en X
close all; clear all; clc
syms alfa

alfa= pi/2 ;

rotx=[1 0 0 0;...
   0 cos(alfa) -sin(alfa) 0;...
   0 sin(alfa) cos(alfa) 0;...
   0 0 0 1]

%%

syms dx

trax=[1 0 0 8;...
   0 1 0 -4;...
   0 0 1 12;...
   0 0 0 1]


%%

r=[-3 4 -11 1]'

P0= trax*rotx*r

%% que pasa ahora si primero hacemos la traslación y luegola rotación
p1=rotx*trax*r

%% ejemplo 3.6 pagina 75 libro de Barrientos 

% primero - 90 grados con respeco a x, traslacion de (5 5 10 1) Y YNA ROT 
 %(z+90) 
%rotación en X
close all; clear all; clc
syms alfa

alfa= -pi/2 ;

rotx=[1 0 0 0;...
   0 cos(alfa) -sin(alfa) 0;...
   0 sin(alfa) cos(alfa) 0;...
   0 0 0 1]

%% AHOARA LA TRASLACIÓN DE (5 5 10 1)

syms dx

trax=[1 0 0 5;...
   0 1 0 5;...
   0 0 1 10;...
   0 0 0 1]


%% FINALMENTE LA ROTACION EN Z DE +90 


%ROTACIÓN EN EL EJE Z

syms gama

gama= pi/2; % +90 GRADOS

rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]

%% LA COMPOSICIÓN QUEDA 


rotz*trax*rotx


%%


