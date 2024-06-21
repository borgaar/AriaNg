FROM node:latest

WORKDIR /app

RUN npm install -g gulp-cli

COPY package*.json ./

RUN npm install --locked

COPY . .

RUN gulp clean
RUN gulp build

CMD ["gulp", "serve:dist"]
