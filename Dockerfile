FROM node:latest

RUN npm install -g gulp-cli

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN gulp clean
RUN gulp build

CMD ["gulp", "serve:dist"]
