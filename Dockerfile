FROM node:alpine AS build-image

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npx parcel build src/index.html --dist-dir dist --public-url "/"

FROM nginx:alpine

COPY --from=build-image /app/dist /usr/share/nginx/html