# Historial Peso

Creado con Flutter este consiste en la creación de una aplicación que funcionará en los dispositivos Android con una versión superior al 7.0 con una cobertura superior al 90% de los dispositivos que funcionan en este sistema operativo.

La aplicación guardara de forma local todos los datos que se introduzcan para así poder visualizarse después y poder hacer comparaciones con mediciones anteriores.


El objetivo que se pretende conseguir guardando estas mediciones es de poder visualizar de manera más cómoda la evolución que se está realizando de los diferentes valores corporales. Estos valores que se medirán serán:
* Peso (Kg)
* Músculo (%)
* Grasa (%)
* Agua Corporal (%)
* Masa Ósea (Kg)

**Todas las mediciones tendrán que realizarse con una báscula que permita obtener al menos estos 5 valores**

Lo primero que veremos nada más ingresar en la aplicación será la pantalla de Home vacía y el menú al que solo se puede acceder **deslizando desde el borde izquierdo hacia el centro.** Al pulsar sobre *Ver Todos* nos saldrá la tercera imagen que tiene como título *Historial* que tampoco tiene datos.

<p align="center">
<img  src="capturas/captura1.jpg" width="300" alt="Primera pantalla sin datos">
  <span> &nbsp;&nbsp;&nbsp; </span>
  <img  src="capturas/captura2.jpg" width="300" alt="Visualización del menú">
   <span>&nbsp;&nbsp;&nbsp; </span>
  <img  src="capturas/captura3.jpg" width="300" alt="Visualización del menú">
</p>


Si pulsamos en el botón de añadir nos aparecerá la pantalla en la que tenemos que escribir los datos que nos proporcione nuestra báscula y pulsar añadir. **ATENCIÓN: Es obligatorio que todos los datos sean introducidos, de no ser así la aplicación no deja continuar.**

<p align="center">
<img  src="capturas/captura10.jpg" width="300" alt="Pantalla añadir superior">
  <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
  <img  src="capturas/captura4.jpg" width="300" alt="Pantalla añadir inferior">
</p>

Una vez añadido cambiará nuestra pantalla de Home, ya que ya si tenemos valores.

<p align="center">
<img  src="capturas/captura11.jpg" width="300" alt="Primer pesaje">
</p>

La pantalla anterior nos mostraba información del último pesaje, si a la semana volvemos a meternos en la aplicación nos aparecerá un mensaje como el de la siguiente imagen:

<p align="center">
<img  src="capturas/captura5.jpg" width="300" alt="Primer pesaje">
</p>

La pantalla donde se guardan todos los registros ("Historial") también se irá actualizando según introduzcamos valores. Aparecerán ordenados de manera inversa a la temporal apareciendo así en las primeras posiciones los últimos valores introducidos.
<p align="center">
<img  src="capturas/captura5.jpg" width="300" alt="Primer pesaje en Historial">
</p>

Si añadimos un segundo registro, el Home nos cambiara y nos ofrecerá la diferencia entre los dos últimos pesajes, indicando también el tiempo que ha pasado entre la medición de esos dos valores. En el historial también se irán añadiendo en el orden descrito anteriormente. Los cambios obtenidos entre las dos mediciones considerados positivos se marcarán en verde y los negativos en rojo.

<p align="center">
<img  src="capturas/captura7.jpg" width="300" alt="Home con dos valores">
  <span> &nbsp;&nbsp; </span>
 <img  src="capturas/captura9.jpg" width="300" alt="Home con dos valores y negativos">
   <span> &nbsp;&nbsp; </span>
   <img  src="capturas/captura8.jpg" width="300" alt="Historial con 2 valores">
</p>

<p align="center">
</p>

## Mejoras Futuras

* Introducción de perfiles para llevar la medición de varios usuarios.
* Comprobación de errores de datos introducidos, puesto que no existe ningún tipo de control.
* Modificación y eliminación de registros.
* Comparación entre dos pesajes seleccionables.

## Trabajos Relacionados

Existe una versión idéntica a este proyecto que almacena los datos de forma remota en gracias al servicio gratuito de Firebase. Esta versión por temas de claves y limitaciones por el propio Firebase la mantengo privada.
