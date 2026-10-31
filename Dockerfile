# Imagen base oficial de Nginx
FROM nginx:latest

# Copia el contenido de la carpeta web al directorio de Nginx dentro del contenedor
COPY web/ /usr/share/nginx/html/

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
