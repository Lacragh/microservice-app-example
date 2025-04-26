FROM node:8.17.0-alpine

# ARG: Se define para pasarla durante el build
ARG TODOS_API_ADDRESS="https://todos-api-111693207847.us-central1.run.app"

# ENV: Se guarda permanentemente en el contenedor
ENV TODOS_API_ADDRESS=${TODOS_API_ADDRESS}

WORKDIR /home/microservice-app-example/frontend
COPY . /home/microservice-app-example/frontend

RUN npm install
RUN npm run build

EXPOSE 8080

CMD ["npm","start"]
