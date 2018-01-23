%% EJ01_37877_ArielGuerrero.m
% Soluciones al ejercitario de matlab numero 1

%Copyright (c)2018, Ariel Guerrero <ariel.guerreroE@uc.edu.py>, 22/01/2018

% Revision history:
% 22/01/2018 AG Creacion - Ejercicio 01

% Things to be done
% Enviar a ariel.guerrero@uc.edu.py
% Subject: AL2018-EJXX-MATRICULA-NombreApellido

%% Ejercicio 01

%Inicializacion para nuevo ejercicio
disp('Ejercicio #1 del ejercitario #1')
disp('Presione una tecla para continuar..')
pause() % Esperar la presion de alguna tecla
clc     %limpiar la linea de comando
clear   % limpiar el workspace

% Paso 1 - Genere matrices aleatorias A y B de 4 x 4
A = round(10*rand(4)); B = round(10*rand(4));

%% Ejercicio 01.A
A1 = A*B; A2 = B*A; A3 = (A'*B')'; A4 = (B'*A')';

%% Ejercicio 01.B
A1 = A'*B'; A2 = (A*B)'; A3 = B'*A'; A4 = (B*A)';

%% Ejercicio 01.C
A1 = inv(B*A);  A2 = inv(A)*inv(B);
A3 = inv(B*A)'; A4 = inv(B)*inv(A)';

%% Ejercicio 01.D
A1 = inv((A*B)');       A2 = inv(A'*B'); 
A3 = inv(A')*inv(B');   A4 = (inv(A)*inv(B))';

A
B
A1
A2
A3
A4


%% Ejercicio 02

%Inicializacion para nuevo ejercicio
disp('Ejercicio #2 del ejercitario #1')
disp('Presione una tecla para continuar..')
pause() % Esperar la presion de alguna tecla
clc     %limpiar la linea de comando
clear    % limpiar el workspace

%% Paso 1 - Generar una matriz A de 8x8
A = round(10*rand(8));
% Paso 2 - Generar el vector de coeficientes b
b = round(10*rand(8,1));

%% Ejericio 02.A

%% Ejercicio 02.a
U = rref([A b])
[m,n]=size(U);
% Resolviendo Ax=b usando Gauss-Jordan
% el resultado esta en la ultima columna de la matriz escalonada reducida
x=U(:,n) 
% Otra forma de resolver Ax=b
y=A\b

%%Ejercicio 02.b
format long
x
y
x-y
format short
x
y
x-y

%% Ejercicio 02.c
% Calculando los vectores residuales
r = b - A*x
s = b - A*y

% ¿Cuál tiene menos error?


