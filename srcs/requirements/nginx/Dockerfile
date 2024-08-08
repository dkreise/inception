FROM debian:12.6

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
