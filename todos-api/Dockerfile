# Utiliza la imagen de Node.js para ejecutar la aplicación de tareas
FROM node:8.17.0

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos fuente de la aplicación al contenedor
COPY . .

# Instala las dependencias de Node.js
RUN npm install

# Define variables de entorno necesarias para la aplicación
ENV TODO_API_PORT=8082
ENV JWT_SECRET=PRFT
ENV REDIS_HOST=127.0.0.1
ENV REDIS_PORT=6379
ENV REDIS_CHANNEL=log_channel

# Expone el puerto definido para el servicio
EXPOSE ${TODO_API_PORT}

# Comando que se ejecuta cuando se inicia el contenedor
CMD ["npm", "start"]

