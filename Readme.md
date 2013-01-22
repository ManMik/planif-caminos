# Planificación de caminos
---

### Descripción

Planificación del camino de un robot móvil entre dos puntos pasando por un punto intermedio

### Planteamiento 

El programa calcula los coeficientes de los polinomios para que pasen por un punto inicial (p0), despegue (p1), intermedio (p2), asentamiento (p3) y final (p4). 

Tramos del camino:
* De p0 a p1
* De p1 a p3 (pasando por el punto intermedio p2, situado a mitad del tiempo que durará el recorrido por este tramo)
* De p3 a p4

![mapa](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image23.png)

Para el punto inicial y final tenemos posición velocidad y aceleración. Para p1 y p3 tenemos continuidad, posición, velocidad y aceleración. El punto p2 es un punto extra el cual queda a mitad del recorrido del 2º tramo. Para el punto 2 tenemos sólo su posición.

Tenemos 3 segmentos = 3 (3+1) + 3 = 15 coeficientes. Se calcula la trayectoria con tres polinomios de grado 4 (4-4-4).

Polinomios: 
* ![h1(t) = a14t^4 + a13t^3 + a12t^2 + a11t+a10](http://latex.codecogs.com/gif.latex?h1(t\)=a_{14}*t_{0}^{4}+a_{13}*t_{0}^{3}+a_{12}*t_{0}^{2}+a_{11}*t_{0}+a_{10})
* ![h2(t) = a14t^4 + a13t^3 + a12t^2 + a11t+a10](http://latex.codecogs.com/gif.latex?h2(t\)=a_{24}*t_{0}^{4}+a_{23}*t_{0}^{3}+a_{22}*t_{0}^{2}+a_{21}*t_{0}+a_{20})
* ![h3(t) = a14t^4 + a13t^3 + a12t^2 + a11t+a10](http://latex.codecogs.com/gif.latex?h3(t\)=a_{34}*t_{0}^{4}+a_{33}*t_{0}^{3}+a_{32}*t_{0}^{2}+a_{31}*t_{0}+a_{30})

Punto inicial (p0)
* Posición: ![p0 = a14t0^4 + a13t0^3 + a12t0^2 + a11t0 + a10](http://latex.codecogs.com/gif.latex?p0=a_{14}*t_{0}^{4}+a_{13}*t_{0}^{3}+a_{12}*t_{0}^{2}+a_{11}*t_{0}+a_{10})
* Velocidad: ![v0 = 4*a14t0^3 + 3*a13t0^2 + 2*a12t0 + a11](http://latex.codecogs.com/gif.latex?v0=4*a_{14}*t_{0}^{3}+3*a_{13}*t_{0}^{2}+2*a_{12}*t_{0}+a_{12}*t_{0}+a_{11})
* Aceleración: ![a0 =4*3*a14t0^2 + 3*2*a13t0+ 2*a12](http://latex.codecogs.com/gif.latex?a0=4*3*a_{14}*t_{0}^{2}+3*2*a_{13}*t_{0}+2*a_{12})

Punto de despegue (p1)
* Posición: ![p1 = a24t1^4+ a23t1^3 + a22t1^2 + a21t1+a20](http://latex.codecogs.com/gif.latex?p1=a_{24}*t_{0}^{4}+a_{23}*t_{0}^{3}+a_{22}*t_{0}^{2}+a_{21}*t_{0}+a_{20}) 
* Continuidad Posición: a14*t1^4 + a13*t1^3+ a12*t1^2 + a11*t1 + a10 = a24* t1^4 + a23*t1^3 + a22*t12 + a21*t1 + a20
* Continuidad Velocidad: 4*a14*t1^3 + 3*a13*t1^2 + 2*a12*t1 + a11 = 4*a24*t1^3+ 3*a23*t1^2 + 2*a22 +a21
* Continuidad Aceleración: 12*a14*t1^2 + 6 *a13*t1+ 2*a12 =12*a24 + 6 *a23*t1+ 2*a22

Punto extra (p2)
> La posición debe venir determinada por la curva 2, la aceleración y la velocidad, la marca la propia curva, no el punto en cuestión. El tiempo t2, ha de ser la mitad del tiempo del segundo tramo.
* Posición: p2 = a24*t2^4 + a23*t2^3 + a22*t2^2 + a21*t2 + a20 
* Tiempo: t2 = (t3-t1)/2

Punto de asentamiento (p3)
* Posición: p3 = a34*t3^4 + a33*t3^3 + a32*t3^2 + a31*t3 + a30
* Continuidad Posición: a24*t3^4 + a23*t3^3 + a22*t3^2 + a21*t3 + a20 = a34*t3^4 + a33*t3^3 + a32*t3^2 + a31*t3 + a30
* Continuidad Velocidad: 4*a24*t3^3 + 3*a23*t3^2 + 2*a22*t3+ a21 = 4*a34*t3^3 + 3*a33*t3^2 + 2*a32*t3+ a31
* Continuidad Aceleración:  12*a24*t3^2 + 6*a23*t3 + 2*a22 = 12*a34*t3^2 +6*a33*t3+ 2*a32

Punto final (p4)
* Posición: p4 = a34*t_F^4 + a33*tF_F^3 + a32*tF_F^2 + a31*t_F + a30 
* Velocidad: v4 = 4*a34*t_F^3 + 3*a33*t_F^2 + 2*a32*t_F + a31
* Aceleración: a4 = 12*a34*t_F^2+ 6*a33t_F+ 2*a32

En forma Matricial:
![matriz](https://raw.github.com/Miguelos/planif-caminos/master/img/formulas/image24.png)

Con todas las ecuaciones descritas anteriormente se crea el archivo crea el programa camino.m donde se muestan las trayectorias de cada prueba que se realce. Para mayor comodidad, se introducen los datos de entrada a la función del siguiente modo:

```matlab
function practica3(p0, p1, p2, p3, p4, tt1, tt2, tt3)
```
> p0: punto inicial.
> p1: punto despegue.
> p2: punto intermedio.
> p3: punto aproximación.
> p4: punto final.
> tt1: tiempo tramo 1.
> tt2: tiempo tramo 2.
> tt3: tiempo tramo 3.

> Los puntos se introducen en forma de par [X,Y]

---

###Pruebas

A continuación se muestran unas pruebas realizadas con la ejecución del programa para distintos parámetros de entrada. 
En las figuras se aprecia la trayectoria del efector final del robot (colores rojo azul y amarillo) y los obstáculos (color negro). La línea verde alrededor de los objetos que representa el margen de distancia (0.8) que tiene que haber entre la trayectoria del robot y los obstáculos.

####Prueba 1

Datos de entrada

```Matlab
% Puntos 
p0=[13,4];
p1=[9.5,4.3];
p2=[8.8,7.1];
p3=[7.2,10.4];
p4=[4,11];

% tiempo para cada segmento:
tt1=5;
tt2=5;
tt3=2;
```

#####Figuras

![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image19.png)
![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image22.png)

Aquí apreciamos como la velocidad del tercer tramo pasa de ser muy alta a 0 rápidamente, por lo que la aceleración, sobre todo en el sentido de las x, es muy brusca.

####Prueba 2

Datos de entrada

```Matlab
% Puntos objetivo:
p0=[13,4];
p1=[9.6,4.4];
p2=[8.5,8];
p3=[7.3,10.4];
p4=[4,11];

% tiempo para cada segmento:
tt1=7;
tt2=5;
tt3=2;
```	

#####Figuras

![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image20.png)
![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image17.png)

Aquí el robot acelera y gana velocidad al final del segundo tramo para que haya continuidad. 
También se aprecia como en el primer tramo la velocidad y la aceleración son muy suaves.

####Prueba 3

Datos de entrada
```Matlab
% Puntos objetivo:
p0=[13,4];
p1=[8.5,4.4];
p2=[8.5,8];
p3=[7.3,11];
p4=[4,11];

% tiempo para cada segmento:
tt1=4;
tt2=1;
tt3=5;
```
#####Figuras:

![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image18.png)
![trayectoria](https://raw.github.com/Miguelos/planif-caminos/master/img/graficas/image21.png)

En este ejemplo podemos apreciar como el primer y segundo tramo tienen una trazada mas suave ya que la velocidad en ambos es menor.

En las gráfica de aceleración, las dos últimas, podemos apreciar que tanto en el sentido de las x como el de las y hay una gran aceleración y luego deceleración para cumplir la continuidad con el siguiente tramo

De los movimientos anteriores, la mejor trayectoria la obtenemos con la primera prueba. La trayectoria es prácticamente paralela al camino que se forma entre los dos obstáculos. Con esta trayectoria podemos conseguir una mayor tranquilidad por el espacio que deja con los obstáculos el manipulador y dado el tiempo que le hemos dejado a este tramo (5 s) es más que una velocidad prudencial para transportar objetos entre esos obstáculos.

---

Realizado por https://github.com/recoletosmb y https://github.com/Miguelos
