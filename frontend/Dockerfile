# build
FROM node:16.20.0-alpine3.18 as builder
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

FROM nginxproxy/nginx-proxy
COPY ./nginx.tmpl /app/nginx.tmpl
COPY --from=builder /usr/src/app/dist/frontend/ /var/www-data/frontend/
WORKDIR /app/
EXPOSE 80




