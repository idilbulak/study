FROM	alpine:3.17
RUN		apk update && apk add --no-cache nginx
WORKDIR /var/www/html
EXPOSE  80
CMD     ["nginx", "-g", "daemon off;"]
