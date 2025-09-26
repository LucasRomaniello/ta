%% ===============================================================
% EJERCICIO 2 - Rotar un cuadrado alrededor del eje Y
% ---------------------------------------------------------------
% Figura inicial (ORIGEN DEL EJERCICIO):
%   Cuadrado en el plano YZ definido por los 4 vértices (en homogéneas):
%     V1 = (0,0,3,1)
%     V2 = (0,0,1,1)
%     V3 = (0,2,3,1)
%     V4 = (0,2,1,1)
%   (Se repite el primer punto al final para cerrar la figura)
%
% Consigna:
%   1) Dibujar el cuadrado original (resaltando vértices).
%   2) Rotarlo alrededor del eje Y un ángulo +pi/2.
%   3) Dibujar el cuadrado resultante.
%   4) Comentar en qué plano queda la figura tras la rotación.
%
% Nota geométrica clave:
%   - El cuadrado inicial tiene x=0 (plano YZ).
%   - Al rotar alrededor de Y con +pi/2:
%         x' =  x*cos(theta) + z*sin(theta)  ->  z (porque x=0, cos=0, sin=1)
%         z' = -x*sin(theta) + z*cos(theta)  ->  0 (porque x=0, cos=0)
%     Por lo tanto, la figura cae en el plano XY (z=0).
%
% Cómo ejecutar:
%   - Guardar este archivo como "ej2_cuadrado_rotY.m"
%   - En la Command Window escribir: ej2_cuadrado_rotY
%% ===============================================================

close all; clear; clc; format compact

%% ---------------------------------------------------------------
% 1) Definición del cuadrado (homogéneas 4xN)
%    Orden: V1 -> V2 -> V4 -> V3 -> V1 (para “caminar” el contorno)
% ---------------------------------------------------------------
V1 = [0; 0; 3; 1];
V2 = [0; 0; 1; 1];
V3 = [0; 2; 3; 1];
V4 = [0; 2; 1; 1];

Sq = [ V1, V2, V4, V3, V1 ];  % 4 vértices + cierre

%% ---------------------------------------------------------------
% 2) Parámetros visuales (colores, tamaños)
% ---------------------------------------------------------------
colEdgeOrig  = [0 0 0];      % negro bordes original
colVertOrig  = [0 0.45 1];   % azul vértices original
colEdgeRot   = [0.8 0 0];    % rojo bordes rotado
colVertRot   = [1 0.6 0];    % naranja vértices rotado
lw = 1.6;                    % grosor de línea
ms = 12;                     % tamaño de vértices

%% ---------------------------------------------------------------
% 3) Ventana, ejes y origen marcado
% ---------------------------------------------------------------
figure('Name','Ejercicio 2 - Cuadrado YZ rotado alrededor de Y'); 
grid on; axis equal; hold on; view(45,25)
xlabel('X'); ylabel('Y'); zlabel('Z');

% Rango para ver origen y figura cómodos
xlim([-2 5]); ylim([-1 4]); zlim([-1 5]);

% Marcar el origen (0,0,0) bien visible
marcarOrigen();

%% ---------------------------------------------------------------
% 4) Dibujar cuadrado original
% ---------------------------------------------------------------
dibujarFiguraConVertices(Sq, colEdgeOrig, lw, colVertOrig, ms, 'Cuadrado original (plano YZ)');

%% ---------------------------------------------------------------
% 5) Rotación alrededor de Y con +pi/2 y dibujo del resultado
% ---------------------------------------------------------------
theta = +pi/2;
RY = rotyH(theta);

Sq_rot = RY * Sq;  % aplicar rotación a todos los puntos

dibujarFiguraConVertices(Sq_rot, colEdgeRot, lw, colVertRot, ms, ...
    'Cuadrado rotado (+\pi/2 en Y)');

title('EJ2: Cuadrado en YZ ? rotación +\pi/2 alrededor de Y');
legend show

%% ---------------------------------------------------------------
% 6) Verificación simple del plano final
%    (Si todo salió bien, las coordenadas z del resultado deberían ser ~0)
% ---------------------------------------------------------------
z_coords = Sq_rot(3, :);   % fila Z
fprintf('Mín |z''| del cuadrado rotado: %.6f\n', min(abs(z_coords)));

% Comentario:
%  - Verás que z' ? 0 (dentro de error numérico), luego el cuadrado rotado
%    quedó en el plano XY, como predice la geometría.

%% ===============================================================
% ========== FUNCIONES AUXILIARES (al final del script) ==========
% ===============================================================

function R = rotyH(theta)
% Rotación homogénea 4x4 alrededor del eje Y
R = [ cos(theta)  0  sin(theta)  0;
      0           1  0           0;
     -sin(theta)  0  cos(theta)  0;
      0           0  0           1];
end

function dibujarFiguraConVertices(P, colorEdge, lineWidth, colorVerts, markerSize, nombre)
% Dibuja bordes y vértices de una figura en 3D (P es 4xN homogénea)
plot3(P(1,:), P(2,:), P(3,:), '-', ...
    'Color', colorEdge, 'LineWidth', lineWidth, 'DisplayName', nombre);

% Vértices (sin el último que repite el primero para cerrar)
X = P(1,1:end-1); Y = P(2,1:end-1); Z = P(3,1:end-1);
scatter3(X, Y, Z, markerSize^2, colorVerts, 'filled', ...
    'MarkerEdgeColor','k','LineWidth',0.6, ...
    'DisplayName', [nombre ' (vértices)']);
end

function marcarOrigen()
% Dibuja el origen (0,0,0) con marcador grande y visible
X0 = 0; Y0 = 0; Z0 = 0;
tam = 200; cMagenta = [1 0 1];
scatter3(X0, Y0, Z0, tam, cMagenta, 'filled', ...
    'Marker', 'p', 'MarkerEdgeColor','k', 'LineWidth', 0.8, ...
    'DisplayName','Origen (0,0,0)');
end
