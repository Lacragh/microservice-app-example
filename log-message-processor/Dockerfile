# Utiliza la imagen de Python 3.6 para ejecutar el procesador de mensajes
FROM python:3.6

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de la aplicación al contenedor
COPY main.py .
COPY requirements.txt .

# Instala las dependencias de Python necesarias para la aplicación
RUN pip install --no-cache-dir -r requirements.txt

# Define variables de entorno necesarias para la aplicación
ENV REDIS_HOST=127.0.0.1
ENV REDIS_PORT=6379
ENV REDIS_CHANNEL=log_channel

# Comando que se ejecuta cuando se inicia el contenedor
CMD ["python3", "main.py"]

