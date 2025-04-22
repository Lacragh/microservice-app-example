# Utiliza la imagen de Go para construir el binario de la API de autenticación
FROM golang:1.18.2 as build

# Establece el directorio de trabajo dentro del contenedor de compilación
WORKDIR /app

# Copia los archivos fuente necesarios para compilar la aplicación Go
COPY main.go .
COPY tracing.go .
COPY user.go .
COPY Gopkg.toml .
COPY Gopkg.lock .

# Inicializa el módulo de Go y descarga las dependencias
RUN go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
RUN go mod tidy

# Compila la aplicación Go en un binario ejecutable
RUN go build -o auth-api

# Utiliza una imagen ligera de Debian para ejecutar el binario compilado
FROM gcr.io/distroless/base-debian10

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el binario compilado desde el contenedor de compilación
COPY --from=build /app/auth-api .

# Define variables de entorno necesarias para la aplicación
ENV AUTH_API_PORT=8000
ENV USERS_API_ADDRESS=http://127.0.0.1:8083
ENV JWT_SECRET=PRFT

# Expone el puerto definido para el servicio
EXPOSE ${AUTH_API_PORT}

# Comando que se ejecuta cuando se inicia el contenedor
CMD ["./auth-api"]