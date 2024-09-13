FROM nginx:alpine

LABEL maintainer="Chinnayya Chintha <chinnayya.chintha339@gmail.com>"
LABEL description="Frontend for the User Management App served by NGINX"
LABEL version="1.0.0"

RUN rm -rf /usr/share/nginx/html/*

COPY ./index.html /usr/share/nginx/html/index.html
COPY ./ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
