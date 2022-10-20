FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

ENV PORT 80
EXPOSE 80

COPY --from=builder /app/build  /usr/share/nginx/html