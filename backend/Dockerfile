FROM node:18

LABEL maintainer="Chinnayya Chintha <chinnayya.chintha339@gmail.com>"
LABEL description="Backend API for User Management App using Node.js and MySQL with SSL"
LABEL version="1.0.0"

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
COPY certs /usr/src/app/certs

EXPOSE 3000

CMD ["node", "app.js"]
