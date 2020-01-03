#!/bin/sh

openssl \
  req -out /etc/ssl/private/certificate.csr \
  -new -newkey rsa:2048 -nodes -keyout /etc/ssl/private/privatekey.pem \
  -subj "/C=US/ST=OR/L=Portland/O=Docker/CN=my.domain.com"
openssl \
  req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/ssl/private/privatekey.pem \
   -out /etc/ssl/private/certificate.crt \
  -subj "/C=US/ST=OR/L=Portland/O=Docker/CN=my.domain.com"
