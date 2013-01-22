% DATOS DE ENTRADA:
function practica3(p0, p1, p2, p3, p4, tt1, tt2, tt3)

% Puntos objetivo:
%p0=[13,4];
%p1=[9.5,4.3];
%p2=[8.8,7.1];
%p3=[7.2,10.4];
%p4=[4,11];

% tiempo para cada segmento:
%tt1=5;
%tt2=5;
%tt3=2;
% --------------------------------------------------------

% Calculo de los tiempos intermedios:
t0=0;
t1=tt1-t0;
t3=tt2+t1;
t4=tt3+t3;
%tF=t0+tt1+tt2+tt3; es lo mismo que t4
t2=(t3 + t1)/2;

% MATRIZ CON LAS ECUACIONES QUE HAY QUE RESOLVER:

% Se resuelve la matriz general mostrada en el ejemplo:
M=[  t0^4,  	t0^3,   t0^2,   t0,   1,    	0,   	0,   	0,  	0,   	0,   	0,  	0,  	0,  	0,  	0
  4*t0^3,	3*t0^2,   2*t0,	1,   0,    	0,   	0,   	0,  	0,   	0,   	0,  	0,  	0,  	0,  	0
4*3*t0^2,	3*2*t0,  	2,	0,   0,    	0,   	0,   	0,  	0,   	0,   	0,  	0,  	0,  	0,  	0
   	0,     	0,  	0,	0,   0, 	t1^4,	t1^3,	t1^2, 	t1,   	1,   	0,  	0,  	0,  	0,  	0
	t1^4,  	t1^3,   t1^2,   t1,   1,	-t1^4,   -t1^3,   -t1^2,	-t1,  	-1,   	0,  	0,  	0,  	0,  	0
  4*t1^3,	3*t1^2,   2*t1,	1,   0,  -4*t1^3, -3*t1^2,   -2*t1, 	-1,   	0,   	0,  	0,  	0,  	0,  	0
4*3*t1^2,	3*2*t1,  	2,	0,   0, -12*t1^2,   -6*t1,  	-2,  	0,   	0,   	0,  	0,  	0,  	0,  	0
   	0,     	0,  	0,	0,   0, 	t2^4,	t2^3,	t2^2, 	t2,   	1,   	0,  	0,  	0,  	0,  	0
   	0,     	0,  	0,	0,   0,    	0,   	0,   	0,  	0,   	0,	t3^4,   t3^3,   t3^2, 	t3,  	1
   	0,     	0,  	0,	0,   0,	-t3^4,   -t3^3,   -t3^2, 	-t3, 	-1,	t3^4,   t3^3,   t3^2, 	t3,  	1
   	0,     	0,  	0,	0,   0,  -4*t3^3, -3*t3^2,   -2*t3,  	-1,  	0,  4*t3^3, 3*t3^2,   2*t3,  	1,  	0
   	0,     	0,  	0,	0,   0, -12*t3^2,   -6*t3,  	-2,   	0,  	0, 12*t3^2,   6*t3,  	2,  	0,  	0
   	0,     	0,  	0,	0,   0,    	0,   	0,   	0,   	0,  	0,	t4^4,   t4^3,   t4^2, 	t4,  	1
   	0,     	0,  	0,	0,   0,    	0,   	0,   	0,   	0,  	0,  4*t4^3, 3*t4^2,   2*t4,  	1,  	0
   	0,     	0,  	0,	0,   0,    	0,   	0,   	0,   	0,  	0, 12*t4^2,   6*t4,  	2,  	0,  	0
	];

Bx=[p0(1), 0, 0, p1(1), 0, 0, 0, p2(1), p3(1), 0, 0, 0, p4(1), 0, 0]';
By=[p0(2), 0, 0, p1(2), 0, 0, 0, p2(2), p3(2), 0, 0, 0, p4(2), 0, 0]';    

% RESOLVER LAS ECUACIONES:

% Ecuacion:  M*pX=Bx
pX=M\Bx;
% Ecuacion:  M*pY=By
pY=M\By;

% SOLUCIÓN PARA CADA VARIABLE (X,Y)
% Coeficientes de X e Y para las curvas 1 y 2:
pX1=pX(1:5)
pX2=pX(6:10)
pX3=pX(11:15)
pY1=pY(1:5)
pY2=pY(6:10)
pY3=pY(11:15)

% ----------------------------------------------------

% CáLCULO DE LOS PUNTOS (DIBUJO):

% Cálculo de la curva, la velocidad y la aceleración:
tt1=t0:0.1:t1;
tt2=t1:0.1:t3;
tt3=t3:0.1:t4;

% Posición:
x1=polyval(pX1,tt1);
y1=polyval(pY1,tt1);
x2=polyval(pX2,tt2);
y2=polyval(pY2,tt2);
x3=polyval(pX3,tt3);
y3=polyval(pY3,tt3);

% Velocidad:
dpX1=polyder(pX1);
dpY1=polyder(pY1);
dpX2=polyder(pX2);
dpY2=polyder(pY2);
dpX3=polyder(pX3);
dpY3=polyder(pY3);
dx1=polyval(dpX1,tt1);
dy1=polyval(dpY1,tt1);
dx2=polyval(dpX2,tt2);
dy2=polyval(dpY2,tt2);
dx3=polyval(dpX3,tt3);
dy3=polyval(dpY3,tt3);

% Aceleración:
ddpX1=polyder(dpX1);
ddpY1=polyder(dpY1);
ddpX2=polyder(dpX2);
ddpY2=polyder(dpY2);
ddpX3=polyder(dpX3);
ddpY3=polyder(dpY3);
ddx1=polyval(ddpX1,tt1);
ddy1=polyval(ddpY1,tt1);
ddx2=polyval(ddpX2,tt2);
ddy2=polyval(ddpY2,tt2);
ddx3=polyval(ddpX3,tt3);
ddy3=polyval(ddpY3,tt3);

close all

% Dibujo de los obstáculos:
%Vértices del objeto 1: {(6,4),(7,4),(7,9),(6,9)}
o1x=[6 7 7 6]
o1y=[4 4 9 9]
o1xmargen=[5.2 7.8 7.8 5.2 5.2]
o1ymargen=[3.2 3.2 9.8 9.8 3.2]
%Vértices del objeto 2: {(10,6),(12,6),(12,8),(10,8)}
o2x=[10 12 12 10]
o2y=[ 6  6  8  8]
o2xmargen=[9.2 12.8 12.8 9.2 9.2]
o2ymargen=[5.2  5.2  8.8 8.8 5.2]

figure
hold on
fill(o1x,o1y,'k',o2x,o2y,'k')
plot(o1xmargen,o1ymargen,'g',o2xmargen,o2ymargen,'g')
% Dibujo de la solución:
plot(x1,y1,'r',x2,y2,'b',x3,y3,'y', p0(1), p0(2), 'o', p1(1), p1(2), 'x', p2(1), p2(2), 'x', p3(1), p3(2), 'x')
title('Curvas 1 (rojo) y 2 (azul)y 3 (amarillo)');
view(15,15)

figure
hold off
subplot(3,2,1), plot(tt1,x1,'r',tt2,x2,'b',tt3,x3,'y'),title('x(t)')
subplot(3,2,2), plot(tt1,y1,'r',tt2,y2,'b',tt3,y3,'y'),title('y(t)')

subplot(3,2,3), plot(tt1,dx1,'r',tt2,dx2,'b',tt3,dx3,'y'),title('dx(t)')
subplot(3,2,4), plot(tt1,dy1,'r',tt2,dy2,'b',tt3,dy3,'y'),title('dy(t)')

subplot(3,2,5), plot(tt1,ddx1,'r',tt2,ddx2,'b',tt3,ddx3,'y'),title('ddx(t)')
subplot(3,2,6), plot(tt1,ddy1,'r',tt2,ddy2,'b',tt3,ddy3,'y'),title('ddy(t)')
