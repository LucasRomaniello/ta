%% MATRIZ DE TRASLACIÓN 

syms dx

close all; clear all; clc

syms dx dy dz real 
tras=[1 0 0 dx;...
   0 1 0 0;...
   0 0 1 0;...
   0 0 0 1]

%%  le damos a dx = 3 

dx =3

eval (tras)

%% si ahora definimos Tras1

tras1=[1 0 0 1;...
   0 1 0 -6;...
   0 0 1 -7;...
   0 0 0 1]

%%
p=[2 3 4 1]'

p1= tras1*p

%% matrices de rotación

close all; clear all; clc

%ROTACIÓN EN EL EJE Z

syms gama
rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]
%%
gama= pi/2 % 90 GRADOS

rotzz =eval (rotz)
%%
p=[3 0 0 1]'


pp = rotzz*p

%%
close all; clear all; clc

gama= -pi/2;

rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]
%%

p=[3 0 0 1]'

pp = rotz*p


%% rotación en X

close all; clear all; clc

syms alfa

%%
alfa= pi
    
rotx=[1 0 0 0;...
   0 cos(alfa) -sin(alfa) 0;...
   0 sin(alfa) cos(alfa) 0;...
   0 0 0 1]

%%

p=[0 0 3 1]'

pp = rotx*p





%% roración en el eje Y


close all; clear all; clc

syms beta

beta= pi/2

roty=[cos(beta) 0 sin(beta)  0;...
   0 1 0 0;...
   -sin(beta) 0 cos(beta) 0;...
   0 0 0 1]

%%

p=[3 0 0 1]'

pp = roty*p



%% EJERCITACIÓN  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% como colocar el punto p( 3,0,0) en p'(0,0,-3) en un solo movimiento 

close all; clear all; clc





tras1=[1 0 0 -3;...
   0 1 0 0;...
   0 0 1 -3;...
   0 0 0 1]

%%
p=[3 0 0 1]'

p1= tras1*p

%% inversa de una matriz 

Hi=inv(tras1)

%%
Hi*[0 0 -3 1]'

%%
%  como colocar el punto p( 3,0,0) en p'(0,0,-3) con dos rotaciones 

close all; clear all; clc


%ROTACIÓN EN EL EJE Z

syms gama
rotz=[cos(gama) -sin(gama) 0 0;...
   sin(gama)  cos(gama)  0 0;...
   0 0 1 0;...
   0 0 0 1]
%%
gama= pi/2 % 90 GRADOS

rotzz =eval (rotz)
%%
p=[3 0 0 1]'


pp = rotzz*p


%%

syms alfa


alfa= -pi/2
    
rotx=[1 0 0 0;...
   0 cos(alfa) -sin(alfa) 0;...
   0 sin(alfa) cos(alfa) 0;...
   0 0 0 1]

%%

p=[0 3 0 1]'

ppp = rotx*p


%% puedo hacer la combinación en un solo paso ?



RT= rotx*rotzz

%%

ppp= rotx*rotzz*[3 0 0 1]'

%%

RT

%%

RT*[3 0 0 1]'


%%  como vuelvo al punto p inicial ? inverso 

TR= inv(RT)

%%
TR*[0 0 -3 1]'




%% El punto p ( 1,1,0,1) se la aplicarán las siguientes rotaciones en el siguiente orden:
close all; clear all; clc

p = [1 1 0 1]
% primero rotar al punto pp= ( rot y, +pi/2)* p
syms beta

beta= -pi/2

roty=[cos(beta) 0 sin(beta)  0;...
   0 1 0 0;...
   -sin(beta) 0 cos(beta) 0;...
   0 0 0 1]

% segundo rotar ppp= (rot x, -pi/2)*pp
% tercero rotar pppp= (rot z, 3*2/pi) ppp 
% ¿donde queda el punto? por favor grafique cada movimiento 


%% el punto p (0.5; 0.5; 3.4; 1) se le aplicarán las siguientes transformaciones :
% aplicar un desplazamiento para que llegue al punto pp( -3,-3,-3,1) 
% aplicar a PP una traslación y una sola roración para que quede
% el PPP ( 2,2,2,1) 
% calcule la matriz inversa de todo el movimeinto
% y llegue desde el ppp(2,2,2,1) al p (0.5; 0.5; 3,4; 1) de origen 
%

% 
