%% clase01  Visualizacion de matrices.
%
%   See also -

% First version written by Ariel Guerrero 18/01/108.
% Copyright 2018, Ariel Guerrero, ariel.guerrero@uc.edu.py

%% Visualizacion de la matriz de adyacencia. TED Margot Gerritsen
% See also: The Beauty I see in Linear Algebra. Margot Gerritsen. TED
% https://www.youtube.com/watch?v=8CX-Q0gtSp8
% https://www.youtube.com/watch?v=s6p864XVxeU

%% Ejemplo 1 - Uso de graphviz

% Definición de la matriz de adyacencia
A_margot_gerritsen=[[1 0 1 0];[0 1 0 1];[1 0 1 1];[1 1 1 1]];
% Generar un archivo en formato dot
graph_to_dot(A_margot_gerritsen, 'filename', 'A_margot_gerritsen.gv', 'directed',0)

%Continua en la linea de comando
% Fin Ejemplo 1

%% Ejemplo 2 - Financial Portfolio Optimization
% https://sparse.tamu.edu/GHS_psdef/finance256

%Cargamos la matriz
load('finance256.mat')
%Otra manera de descargar la matriz desde internet
%Problem=ssget('GHS_psdef/finance256')


% Convertimos a un grafo
g = graph(Problem.A)

% Inicializamos el reloj
tic

% Graficamos el grafo
plot(g,'NodeLabel',{},'NodeColor',[0.93 0.78 0],'Layout','force');

% Finalizamos el rejoj
toc
