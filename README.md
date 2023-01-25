# Proyecto DNS
# Por Pablo Ramos Medina y Raúl Martín Torrabadella Mendoza

<br> <br>

<p align="center">
  <img width="500" height="500" src="Imágenes/DNS.png">
</p>

<br> <br>

# Índice
1. [Introducción](#id1)
2. [Proyecto. Implantación del servicio DNS en el entorno de trabajo](#id2)
3. [Conclusión](#id3)
4. [Bibliografía](#id4)
5. [Despedida y Agradecimientos](#id5)

# Introducción
<a name="id1"></a>

En este trabajo vamos a hacer un entorno de trabajo en el que instalaremos un servicio DNS, viendo sus posibilidades y haciendo que este sea lo más realista posible, este además será complementado con una subida a Github del proyecto.

# Proyecto. Implantación del servicio DNS en el entorno de trabajo
<a name="id2"></a>

Primeramente, comenzamos con la instalación del servicio DNS tanto en Debian5-Pruebas como en Debian6-Pruebas. De esta forma nos ahorraremos tolerancia a fallos en la resolución DNS.


**Actividad 1:**

La infraestructura seguida para nuestro proyecto es la siguiente:
<br> <br>
![Alt text](Imágenes/infraestructuraDNS.png)

<br> <br>

**Actividad 2:**

A continuación comrobaremos el funcionammiento del DNS en los dos servidores de nombre:  
* Debian5-Pruebas
  - Raúl
  
  ![Alt text](Imágenes/StatusDNS-Debian5TMRM.png)

  
  - Pablo
  
  ![Alt text](Imágenes/StatusDNS-Debian5RMP.png)

  
* Debian6-Pruebas
  - Raúl
    
  ![Alt text](Imágenes/StatusDNS-Debian6TMRM.png)

  - Pablo
    
  ![Alt text](Imágenes/StatusDNS-Debian6RMP.png)
  
<br> <br>

**Actividad 3:**

Espacio de nombres: para este proyecto necesitaremos crear un espacio de nombres para guiarnos y así poder entender la estructura de la red. Para ello, nuestra empresa será “Videopro” y su dominio será videopro.com.

Lo hemos dotado de tres departamentos (Redes sociales, Producción y Recepción) además de los propios servidores DNS y los servidores de correo y web. También incluiremos dentro del departamento de Producción otros tres subdepartamentos (Audio, Video y Efectos especiales).
        
<br> <br>

![Alt text](Imágenes/EspaciodeNombre-ProyectoDNS_RMP-TMRM.png)

**Actividad 4:**

Ahora pasaremos a configurar las zonas directas para que quede igual que en el espacio de nombre.

En nuestro caso estos son los ficheros que utilizaremos:

![Alt text](Imágenes/FicherosUtilizados.png)

Pero antes de todo hemos de configurar el fichero “/etc/bind/named.conf.local”

![Alt text](Imágenes/NamedConfLocal.png)

Para que este muestre como fichero principal de zona el “db.videopro.com”

El esencial es db.videopro.com. ya que es el de más alto nivel.

Fichero db.videopro.com:

* Raul:

![Alt text](Imágenes/DbVideoproCom-TMRM.png)

![Alt text](Imágenes/DbVideoproCom-TMRM-2.png)

* Pablo

![Alt text](Imágenes/DbVideoproCom-RMP.png)

![Alt text](Imágenes/DbVideoproCom-RMP-2.png)

Fichero db.redessociales.videopro.com:

* Raul:

![Alt text](Imágenes/DbRrssVideoproCom-TMRM.png)

* Pablo

![Alt text](Imágenes/DbRrssVideoproCom-RMP.png)

Fichero db.produccion.videopro.com

* Raul:

![Alt text](Imágenes/DbProduccionVideoproCom-TMRM.png)

* Pablo

![Alt text](Imágenes/DbProduccionVideoproCom-RMP.png)

Fichero db.recepcion.videopro.com

* Raul:

![Alt text](Imágenes/DbRecepcionVideoproCom-TMRM.png)

* Pablo

![Alt text](Imágenes/DbRecepcionVideoproCom-RMP.png)

**Actividad 5:**

Lo siguiente que hemos realizado ha sido configurar las zonas inversas de los servidores DNS, lo ficheros que hemos utilizado son dos:

![Alt text](Imágenes/FicherosEsenciales.png)

> Algo que hemos de añadir la foto de ejemplo de los ficheros usados ha sido sacada de las máquinas de "Raúl" en caso de que quieras usar las de Pablo el nombre de los fichero sería: db.172.17.40 y db.172.17.41

Además deberemos añadir en el fichero "/etc/bind/named.conf.local" dos apartados para la zonas inversas:

* Raúl:

![Alt text](Imágenes/NamedConfLocal-TMRM.png)

* Pablo:

![Alt text](Imágenes/NamedConfLocal-RMP.png)

Y ahora pasaremos a ver las configuraciones de los ficheros de Zona Inversa:

> Los fichero son llamados de diferente forma debido a que se usan rangos de ip diferentes para cada uno

* Raúl:

  * db.172.17.55
  
![Alt text](Imágenes/ZonasInversasTMRM-1.png)

![Alt text](Imágenes/ZonasInversasTMRM-1-2.png)

  * db.172.17.56
  
![Alt text](Imágenes/ZonasInversasTMRM-2.png)

* Pablo:

  * db.172.17.40
  
![Alt text](Imágenes/ZonasInversasRMP-1.png)  

  * db.172.17.41
  
![Alt text](Imágenes/ZonasInversasRMP-2.png)

**Actividad  6:**

Para esto instalaremos en nuestro Debian1-Pruebas el servicio DNS.
> En general lo único que deberemos hacer es instalar el servicio DNS en el Debian1-Pruebas, posteriormente solo deberemos poner que el Debian5-Pruebas y Debian 6-Pruebas apunten al Debian1-Pruebas como última opción para que busque en internet.

![Alt text](Imágenes/Act6Debian1.png)

![Alt text](Imágenes/NamedConfOptions.png)

* Raúl:

![Alt text](Imágenes/ResolvConfTMRM.png)

* Pablo:

![Alt text](Imágenes/ResolvConfRMP.png)

**Actividad  7:**

Para equilibrar el balanceo de carga la mitad tendrá el Debian5-Pruebas como primario alternativo el Debian6-Pruebas y la otra mitad al revés.

* Raúl:

Debian 1

![Alt text](Imágenes/Act7ResolvConfDebian1-TMRM.png)
 
Debian 2

![Alt text](Imágenes/Act7ResolvConfDebian2-TMRM.png)

Debian 3

![Alt text](Imágenes/Act7ResolvConfDebian3-TMRM.png)

Debian 5

![Alt text](Imágenes/Act7ResolvConfDebian5-TMRM.png)

Debian 6

![Alt text](Imágenes/Act7ResolvConfDebian6-TMRM.png)

* Pablo:

Debian 1

![Alt text](Imágenes/Act7ResolvConfDebian1-RMP.png)

Debian 2

![Alt text](Imágenes/Act7ResolvConfDebian2-RMP.png)

Debian 3

![Alt text](Imágenes/Act7ResolvConfDebian3-RMP.png)

Debian 5 y 6

![Alt text](Imágenes/Act7ResolvConfDebian5y6-RMP.png)


**Actividad 8:**

> A continuación asignaremos los registros especiales

* Pablo:

![Alt text](Imágenes/Act8RegistrosEspeciales-RMP.png)

* Raúl:

![Alt text](Imágenes/Act8RegistrosEspeciales-TMRM-1.png)

![Alt text](Imágenes/Act8RegistrosEspeciales-TMRM-2.png)


**Actividad 9:**

Lo siguiente que haremos será la transferencia de zona:

> Para empezar configurando en el Debian6-Pruebas pondremos (/etc/bind/named.conf.local) los registros en modo esclavo:

* Raúl:

![Alt text](Imágenes/Act9TransferenciaZona-TMRM.png)

* Pablo:

![Alt text](Imágenes/Act9TransferenciaZona-RMP.png)

> Además debemos cambiar el fichero named.conf.options para activar la opción de que reciba la transferencia de zona:

* Raúl:

![Alt text](Imágenes/Act9TransferenciaZona-NamedConfOptions-TMRM.png)

* Pablo:

![Alt text](Imágenes/Act9TransferenciaZona-NamedConfOptions-RMP.png)

> Por último, tendremos que activar la opción de transferencia de zona en el Debian5-Pruebas.

* Raúl:

![Alt text](Imágenes/ActivacionTransferenciaZona-TMRM.png)

* Pablo:

![Alt text](Imágenes/ActivacionTransferenciaZona-RMP.png)



# Conclusión
<a name="id3"></a>

En este trabajo hemos visto sus posibilidades y a nuestro parecer creemos que nos ha sido de utilidad para el futuro, ya que nos hemos informado de muchas opciones de configuración útiles y de algunos errores que nos han ido surgiendo a lo largo de este.

# Bibliografía
<a name="id4"></a>

Páginas y documentos que hemos visitado y nos han sido útiles para este trabajo.

* <https://docs.google.com/document/d/1SeBMEK_E_k2IVPu3FuOnJSZEZruWPnddoj-okjIqnGI/edit>
* <https://github.com/>
* <https://creativecommons.org/licenses/?lang=es_ES>
* <https://stackoverflow.com/questions/2643502/git-how-to-solve-permission-denied-publickey-error-when-using-git>
* <https://es.stackoverflow.com/questions/77684/c%C3%B3mo-crear-carpetas-en-un-repositorio-de-github-sin-usar-git>
* <https://chuletitaspinguino.wordpress.com/2016/11/05/crear-indices-con-markdown/>

  
# Despedida y Agradecimientos
 <a name="id5"></a>

<p align="center">
  <img width="500" height="500" src="Imágenes/agradecimientos.png">
</p>



