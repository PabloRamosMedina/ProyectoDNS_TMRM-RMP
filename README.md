# Proyecto DNS
# Por Pablo Ramos Medina y Raúl Martín Torrabadella Mendoza

<br> <br>

<p align="center">
  <img width="500" height="500" src="Imágenes/DNS.png">
</p>

<br> <br>

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
