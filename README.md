# Servidor Linux Automatizado y Containerizado con Docker

Este repositorio contiene la configuración, scripts de automatización y documentación técnica para la implementación de un servidor Linux sobre arquitectura Ubuntu Server. El proyecto abarca desde la administración básica del sistema, gestión de usuarios y permisos, hasta el monitoreo automatizado con tareas programadas, control de versiones con Git/GitHub y el despliegue de servicios web mediante contenedores, redes y volúmenes persistentes en Docker.

---

## Integrantes del Equipo

| Nombre Completo | Carnet |
| :--- | :---: |
| Jehosua Abdiel Cañas Tijerino| CT24001|
| Vanesa Gabriela Arevalo Elias | AE25016 |
| Carlos Alberto Narváez Morán| NM25012|
| Joseline Rosibel Aldana Aldana| AA13081|

---

## Arquitectura y Componentes del Sistema

El proyecto documenta la implementación técnica de la infraestructura mediante los siguientes componentes:

1. **Administración del Servidor Linux:** Configuración del host (servidor-grupo7), creación de cuentas de usuario (adminsys, tecnico, visitante), asignación de grupos del sistema (soporte, web, sudo) y definición de una estructura de directorios con permisos de herencia (SetGID).
2. **Automatización y Monitoreo:** Desarrollo de un script en Bash (reporte_sistema.sh) para recopilar métricas del sistema y su automatización mediante tareas programadas en Cron (crontab).
3. **Control de Versiones:** Vinculación del entorno local del servidor con el repositorio remoto en GitHub para el control de cambios e historial de integraciones.
4. **Infraestructura Containerizada con Docker:** Despliegue de servicios web Nginx sobre entornos aislados, creación de imágenes personalizadas mediante Dockerfile, orquestación de redes internas y gestión de datos persistentes con volúmenes.

---

## Estructura de Directorios
La estructura base de archivos y directorios en el servidor se organiza en /proyecto/ con la siguiente distribución y esquema de permisos:
```
/proyecto/
├── datos/        
├── web/          
├── scripts/      
├── capturas/     
├── Dockerfile    
└── README.md     
```

---
## Fases de Implementación
**1. Preparación del Entorno del Servidor**
* Se asignó el Hostname que permite identificar la máquina como servidor-grupo7 mediante el uso de hostnamectl. 
* Se hizo una Gestión de Usuarios y Grupos que permite crear usuarios y grupos, asignando privilegios sudo al usuario adminsys para la administración del sistema. 
* Se hiso una Estructura y Permisos que permite organizar los directorios bajo /proyecto/ y aplicar el bit SetGID (chmod 2770) para garantizar la herencia del grupo en los archivos creados. 

**2. Automatización y Monitoreo**
* Se hizo un script de diagnóstico que permite recopilar información del sistema, incluyendo la fecha y hora, el hostname, los usuarios activos, el espacio disponible en disco, la memoria RAM libre y los contenedores Docker en ejecución.
* Se realizó una programación de tareas con Cron que permite ejecutar automáticamente el script cada 30 minutos y guardar los registros generados en /var/log/proyecto/reporte_sistema.log.

**3. Control de Versiones**
* Se inicializó el repositorio Git en /proyecto/, se configuraron las credenciales y se realizó el control de versiones y sincronización del código con el repositorio remoto proyecto-linux-grupo7 en GitHub

**4. Instalación y Verificación de Docker**
* Realizando un Despliegue del Motor Docker, Instalando docker.io, habilitando el servicio en el arranque del sistema (systemctl enable docker) y añadiendo los usuarios adminsys y tecnico al grupo docker.
* Finalizando con una Prueba de Funcionamiento, ejecutando y verificando el contenedor hello-world.

**5. Servidor Web Containerizado**
* Se realizo el Despliegue con Nginx Oficial, Ejecutando un contenedor Nginx en segundo plano (detached), vinculando el puerto host 8080 al puerto 80 del contenedor y montando el directorio /proyecto/web/ en /usr/share/nginx/html/.

**6. Docker Avanzado**
* Se diseñó un Dockerfile personalizado donde se especifica la construcción de una imagen propia basada en nginx:latest, copiando el contenido de /proyecto/web/ hacia el directorio del servidor y exponiendo el puerto 80.
* Después de paso a la Compilación y construcción de la imagen local servidor-grupo7 y despliegue del contenedor en el puerto 8081.

**7. Redes y Volúmenes en Docker**
* Se creó una red Aislada (red-proyecto), de una red de tipo bridge para la comunicación entre contenedores y despliegue de Nginx en el puerto 8082.
* Se creó y monto Volumen Persistente (volumen-web) independiente para preservar la persistencia de datos web, mapeado al puerto 8083.

**8. Pruebas y Verificación Final**
* Se realizó una prueba de conectividad inter-contenedor mediante la ejecución de un contenedor basado en alpine conectado a red-proyecto, validando la resolución de nombres y la conectividad ICMP (ping) hacia los servicios web.
* Se realizó una auditoría integral, verificando la ejecución del daemon cron, el estado activo de los contenedores y la sincronización del repositorio remoto.

## Tecnologías Utilizadas

- **Sistema Operativo:** Ubuntu Server 24.04 LTS
- **Infraestructura en la Nube:** Vultr Compute Instance
- **Motor de Contenedores:** Docker Engine
- **Servidor Web:** Nginx
- **Lenguaje de Scripting:** Bash
- **Control de Versiones:** Git / GitHub
- **Herramientas de Acceso Remoto:** SSH / PuTTY
