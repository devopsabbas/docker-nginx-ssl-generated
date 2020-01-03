FROM nginx:alpine

WORKDIR /etc/nginx
RUN apk add openssl

ADD generate-certs.sh /etc/nginx/generate-certs.sh
RUN chmod +x /etc/nginx/generate-certs.sh
ADD vhost.conf /etc/nginx/conf.d/default.conf

CMD /bin/sh -c /etc/nginx/generate-certs.sh && nginx -g 'daemon off;'