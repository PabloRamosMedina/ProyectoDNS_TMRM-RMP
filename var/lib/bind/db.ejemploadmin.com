; Estaciones de trabajo del departamento Administración

PC3.recepcion	3600	IN	A	172.17.40.3
PC4.recepcion.ejemplo.com.	3600	IN	A	172.17.40.4

$ORIGIN contabilidad.ejemplo.com.
PC5	3600	IN	A	172.17.40.5
PC6	1h	IN	A	172.17.40.6

$ORIGIN secretaria.ejemplo.com.
PC7	1h	IN	A	172.17.40.7
PC8	1h	IN	A	172.17.40.8
PC9	1h	IN	A	172.17.40.9
