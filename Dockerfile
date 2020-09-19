ARG NODE_VERSION=latest
ARG NGINX_VERSION=1.18.0
FROM node:$NODE_VERSION as build

WORKDIR /build

COPY ./package*.json ./
COPY ./vue.config.js .
COPY ./babel.config.js .
COPY ./.eslintrc.js .
#COPY ./.env .

RUN [ "npm", "install", "-g", "@vue/cli" ]
RUN [ "npm", "install" ]
RUN [ "npm", "run", "lint" ]


COPY ./src/ ./src/
#COPY ./public/ ./public/

RUN [ "npm", "run", "build" ]

FROM bitnami/nginx:$NGINX_VERSION

WORKDIR /app
USER 1001

COPY --from=build /build/dist .

EXPOSE 8080


