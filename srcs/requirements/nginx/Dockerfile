FROM	alpine:3.15
RUN		apk update && \
    	apk add --no-cache nginx
COPY    /conf/nginx.conf /etc/nginx.conf
COPY    /tools/ssl /etc/nginx/ssl
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]