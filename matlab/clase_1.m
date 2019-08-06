% Clase 1 - Introduccion al algebra lineal
% Opciones: matlab o scilab
% Suma de vectores e interpretación grafica
% Nombre: Ariel Guerrero
% Fecha: 19/03/2016
% Version: 1.0
% Ejercicio propuesto:
% Codificar en scilab la funcion vectarrow 2/Abril
% Enviar a ariel.guerrero@uc.edu.py
% Subject: AL2016-MATRICULA-EJERCICIO 01

%% Inicializar
clear % Limpio las variables
clf   % Limpio la ventana de dibujo (figure)
clc   % Limpio la ventana de comandos

%% --- Vectores en dos dimensiones R2 ---
%%
% Definir los dos vectores
v = [4 2]'
w = [-1 2]'
% Realizar las operacions
s = v + w;
r = v - w;

% Figura 1.1 Strang 4ta edicion Pagina 3
% Vector adition v+w =(3,4) produces dhe diagonal of parallelogram
figure(1)
subplot(211)
drawVector(v, 'rs-', {'v'}); %Graficamos v
hold on;
drawVector(w, 'g--', {'w'}); %Graficamos w
drawVector(s, {'v+w'}); %Graficamos la suma
%Graficamos los costados --
drawLine([v s]) 
drawLine([w s])
title('v+w =(3,4)');

% Figura 1.1 Strang 4ta edicion Pagina 3
% The linear combination on the rigth is v-w=(5,0)
subplot(212)
drawVector(v, 'rs-', {'v'}); %Graficamos v
hold on;
drawVector(w, 'g--', {'w'}); %Graficamos w
drawVector(-w, 'g--', {'-w'}); %Graficamos w

drawVector(r, {'v-w'}); %Graficamos la resta
%Graficamos los costados --
drawLine([v r]) 
drawLine([-w r])
title('v-w =(5,0)');

%% --- Vectores en tres dimensiones R3 ---
%

% Figura 1.2 Strang 4ta edicion Pagina 4
% Vectores [x y]' e [x y z] correspondes a los puntos (x,y) e (x,y,z)
% 

% Definimos los puntos
p1 = [3 2]'; p2=[2 2 0]'; p3=[0 2 1]';
figure(2)
title('Figure 1.2 Vectors [x y] and [x y z] corresponds to points (x,y) and (x,y,z)');

% Dibujamos (x,y)
%subplot(211)
drawVector(p1, 'rs-', {'(3,2)'}); %Graficamos el punto 1
grid on
ejes = [-1 4 -1 3];
axis(ejes);
hold on

%Dibujamos (x,y,z)
figure(3)
title('Figure 1.2 Vectors [x y] and [x y z] corresponds to points (x,y) and (x,y,z)');

%subplot(212)
drawVector([p2 p3],  {'(2,2,0)','(0,1,1)'},'AxesLabels', {'x','y','z'}); %Graficamos el p2 y p3
view(143,30)
hold on
% Descomponemos el vecto p2 en partes
p2_x=[2 0 0]'; p2_y=[0 2 0]';
% dibujamos --
drawLine([p2_x p2])
drawLine([p2_y p2])
% Descomponemos el vector p3 en partes
p3_y=[0 2 0]'; p3_z=[0 0 1]';
% Dibujamos --
drawLine([p3_y p3])
drawLine([p3_z p3])


