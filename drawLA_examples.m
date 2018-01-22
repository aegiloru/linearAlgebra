%%
% drawLA_examples.m
%
% by AG @ 08/01/2017
%%


%% $$\mathbf{n\cdot x} + d = 0$$ 3D case

n = [1 2 3]';
figure(1); clf; hold on;
drawVector(n, {'n'});       % the normal
drawPlane(n);               % unshifted plane, comes through the origin
drawPlane(n, 5, 'r');       % the plane shifted by "5"
view(60,15)
hold off;
title('Plot 3D planes with drawPlane()')

%% $$\mathbf{n\cdot x} + d = 0$$ 2D case
n = [1 2]';
figure(1); clf; hold on;
drawVector(n, {'n'});       % the normal
drawPlane(n);               % unshifted plane, comes through the origin
drawPlane(n, 2, 'r');       % the plane shifted by "2"
hold off;
title('Plot 2D planes with drawPlane()')

%% 2D mesh
load('home.mat');                   % Load the vertex and face arrays
figure(1); clf;
drawMesh(vertex, face, 'wire');     % Plot the mesh
axis on; grid on; axis([-.5 1.5 0 1.5])
title('Draw a 2D mesh with drawMesh()')