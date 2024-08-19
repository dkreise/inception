FROM debian:12.6

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY default /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
