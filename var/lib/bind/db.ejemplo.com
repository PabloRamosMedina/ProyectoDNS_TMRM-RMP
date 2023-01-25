$TTL 604800
$ORIGIN ejemplo.com.
ejemplo.com. IN SOA PC11 admin (
	2	;Serial
	604800	;Refresh
	86400	;Retry
	2419200	;Expire
	604800 );Negative Cache TTL
		
;Servidores de nombre
@	IN	NS	PC11.ejemplo.com.
	IN	NS	PC12.ejemplo.com.

;Servidores de correo
	IN	MX	10	smtp.ejemplo.com
	IN	MX	20	smtp.ejemplo.com

; Estaciones de trabajo de la red 172.17.40.0/24
$INCLUDE /var/lib/bind/db.ejemplorrhh.com
$INCLUDE /var/lib/bind/db.ejemploadmin.com

; Servidor DHCP + Router. Debian1-Pruebas
PC10	IN	A	172.17.40.13
	IN	A	172.17.41.14

router	IN	CNAME	PC10

; Servidores DNS
PC11	IN	A	172.17.40.15
dns1	IN	CNAME	PC11
PC12	IN	A	172.17.40.16
dns2	IN	CNAME	PC12

; Servidores de la red 172.17.41.0/24
PC14	IN	A	172.17.41.1
PC15	IN	A	172.17.41.2
www	IN	CNAME	PC14
ftp	IN	CNAME	PC14
 
