FROM node:22

RUN npm install -g pm2

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run check

EXPOSE 8080

CMD [ "pm2-runtime", "start", "./src/server.js", "--name", "node-app" ]
