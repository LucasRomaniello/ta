%% ===============================================================
% DIBUJAR UN RECT�NGULO EN 3D CON V�RTICES DADOS
%
% Ejercicio 05_1:
% El siguiente c�digo dibuja un rect�ngulo oblicuo en R3. Pruebe el
% c�digo, vea el dibujo y calcule en qu� eje y con qu� �ngulo debiera girar
% todo el dibujo para que la figura quede en un plano paralelo al  plano XZ 
% no importando la coordenada y 
% 
% 
% Ejercicio 05_2:
% Calcule en qu� eje y con qu� �ngulo debiera girar todo el dibujo para que
% la figura quede en el plano paralelo al  XY sin importar la coordenada Z 
%
% V�rtices:
%   V1 = (0,0,4,1)
%   V2 = (3,0,4,1)
%   V3 = (0,3,0,1)
%   V4 = (3,3,0,1)
%
% El rect�ngulo se arma uniendo los puntos en orden:
%   V1 -> V2 -> V4 -> V3 -> V1
% ===============================================================


close all; clear; clc; format compact

%% ---------------------------------------------------------------
% Definir v�rtices en homog�neas
% ---------------------------------------------------------------
V1 = [0; 0; 4; 1];
V2 = [3; 0; 4; 1];
V3 = [0; 3; 0; 1];
V4 = [3; 3; 0; 1];

Rect = [V1, V2, V4, V3, V1];  % cerramos con V1

%% ---------------------------------------------------------------
% Par�metros visuales
% ---------------------------------------------------------------
colEdge = [0 0.45 0.74];   % celeste bordes
colVert = [0.85 0.33 0.1]; % naranjita v�rtices
lw = 1.8;                  % grosor de l�neas
ms = 14;                   % tama�o v�rtices

%% ---------------------------------------------------------------
% Crear figura y ejes
% ---------------------------------------------------------------
figure('Name','Rect�ngulo en 3D con v�rtices dados');
grid on; axis equal; hold on; view(45,25)
xlabel('X'); ylabel('Y'); zlabel('Z');

% Dibujar origen para referencia
marcarOrigen();

%% ---------------------------------------------------------------
% Dibujar rect�ngulo
% ---------------------------------------------------------------
dibujarFiguraConVertices(Rect, colEdge, lw, colVert, ms, 'Rect�ngulo');

title('Rect�ngulo definido por V1, V2, V3, V4');
legend show

%% ===============================================================
% FUNCIONES AUXILIARES
% ===============================================================

function dibujarFiguraConVertices(P, colorEdge, lineWidth, colorVerts, markerSize, nombre)
% Dibuja bordes y v�rtices de una figura en 3D (P: homog�nea 4xN)
plot3(P(1,:), P(2,:), P(3,:), '-', ...
    'Color', colorEdge, 'LineWidth', lineWidth, 'DisplayName', nombre);

% V�rtices (sin el �ltimo repetido)
X = P(1,1:end-1); Y = P(2,1:end-1); Z = P(3,1:end-1);
scatter3(X, Y, Z, markerSize^2, colorVerts, 'filled', ...
    'MarkerEdgeColor','k','LineWidth',0.7, ...
    'DisplayName', [nombre ' (v�rtices)']);
end

function marcarOrigen()
% Dibuja el origen (0,0,0) con un marcador grande y visible
scatter3(0,0,0,200,[1 0 1],'filled', ...
    'Marker','p','MarkerEdgeColor','k','LineWidth',0.8, ...
    'DisplayName','Origen (0,0,0)');
end
