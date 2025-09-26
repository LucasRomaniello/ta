%% ===============================================================
% DIBUJAR UN RECTÁNGULO EN 3D CON VÉRTICES DADOS
%
% Ejercicio 05_1:
% El siguiente código dibuja un rectángulo oblicuo en R3. Pruebe el
% código, vea el dibujo y calcule en qué eje y con qué ángulo debiera girar
% todo el dibujo para que la figura quede en un plano paralelo al  plano XZ 
% no importando la coordenada y 
% 
% 
% Ejercicio 05_2:
% Calcule en qué eje y con qué ángulo debiera girar todo el dibujo para que
% la figura quede en el plano paralelo al  XY sin importar la coordenada Z 
%
% Vértices:
%   V1 = (0,0,4,1)
%   V2 = (3,0,4,1)
%   V3 = (0,3,0,1)
%   V4 = (3,3,0,1)
%
% El rectángulo se arma uniendo los puntos en orden:
%   V1 -> V2 -> V4 -> V3 -> V1
% ===============================================================


close all; clear; clc; format compact

%% ---------------------------------------------------------------
% Definir vértices en homogéneas
% ---------------------------------------------------------------
V1 = [0; 0; 4; 1];
V2 = [3; 0; 4; 1];
V3 = [0; 3; 0; 1];
V4 = [3; 3; 0; 1];

Rect = [V1, V2, V4, V3, V1];  % cerramos con V1

%% ---------------------------------------------------------------
% Parámetros visuales
% ---------------------------------------------------------------
colEdge = [0 0.45 0.74];   % celeste bordes
colVert = [0.85 0.33 0.1]; % naranjita vértices
lw = 1.8;                  % grosor de líneas
ms = 14;                   % tamaño vértices

%% ---------------------------------------------------------------
% Crear figura y ejes
% ---------------------------------------------------------------
figure('Name','Rectángulo en 3D con vértices dados');
grid on; axis equal; hold on; view(45,25)
xlabel('X'); ylabel('Y'); zlabel('Z');

% Dibujar origen para referencia
marcarOrigen();

%% ---------------------------------------------------------------
% Dibujar rectángulo
% ---------------------------------------------------------------
dibujarFiguraConVertices(Rect, colEdge, lw, colVert, ms, 'Rectángulo');

title('Rectángulo definido por V1, V2, V3, V4');
legend show

%% ===============================================================
% FUNCIONES AUXILIARES
% ===============================================================

function dibujarFiguraConVertices(P, colorEdge, lineWidth, colorVerts, markerSize, nombre)
% Dibuja bordes y vértices de una figura en 3D (P: homogénea 4xN)
plot3(P(1,:), P(2,:), P(3,:), '-', ...
    'Color', colorEdge, 'LineWidth', lineWidth, 'DisplayName', nombre);

% Vértices (sin el último repetido)
X = P(1,1:end-1); Y = P(2,1:end-1); Z = P(3,1:end-1);
scatter3(X, Y, Z, markerSize^2, colorVerts, 'filled', ...
    'MarkerEdgeColor','k','LineWidth',0.7, ...
    'DisplayName', [nombre ' (vértices)']);
end

function marcarOrigen()
% Dibuja el origen (0,0,0) con un marcador grande y visible
scatter3(0,0,0,200,[1 0 1],'filled', ...
    'Marker','p','MarkerEdgeColor','k','LineWidth',0.8, ...
    'DisplayName','Origen (0,0,0)');
end
