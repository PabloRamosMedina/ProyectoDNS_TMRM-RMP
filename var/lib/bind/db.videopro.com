$TTL	604800
$ORIGIN videopro.com.
videopro.com.	IN	SOA	PC11	admin (
		 2	; Serial
		604800	; Refresh
		86400	; Retry
		2419200	; Expire
		604800)	; Negative Cache TTL

; Servidores de nombre

@	IN	NS	PC11.videopro.com.
	IN	NS	PC12.videopro.com.

; Servidores de correo

	IN	MX	10	PC16

; Estaciones de trabajo de la red 172.17.55.0/24

$INCLUDE /var/lib/bind/db.redessociales.videopro.com
$INCLUDE /var/lib/bind/db.produccion.videopro.com
$INCLUDE /var/lib/bind/db.recepcion.videopro.com

; Servidor DHCP + Router

PC10	IN	A	172.17.55.10
	IN	A	172.17.56.10

router	IN	CNAME	PC10
enroutador	IN	CNAME	PC10

; Servidores DNS

PC11	IN	A	172.17.55.11
servidordns1	IN	CNAME	PC11
dns1	IN	CNAME	PC11

PC12	IN	A	172.17.55.12
servidordns2	IN	CNAME	PC12
dns2	IN	CNAME	PC12

; Servidores de la red 172.17.56.0/24

PC14	IN	A	172.17.56.1
www	IN	CNAME	PC14
ftp	IN	CNAME	PC14

PC15	IN	A	172.17.56.2
smtp2	IN	CNAME	PC15

PC16	IN	A	172.17.56.3
servidorcorreo	IN	CNAME	PC16
servidorweb	IN	CNAME	PC16


