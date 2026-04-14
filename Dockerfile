FROM node:alpine S build-image

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npx parcel build "src/index.html" --dist-dir "dist" --public-url "/"

FROM ngnix:alpine
COPY --from-build-image /app/dist /usr/share/ngnix/html