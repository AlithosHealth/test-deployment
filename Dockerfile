FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
RUN npm install dd-trace --save
COPY . .
CMD [ "node", "src/index.js" ]
