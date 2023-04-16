FROM	alpine:3.15
RUN		apk update && apk upgrade && \
    	apk add --no-cache nginx
COPY    /requirements/nginx/conf/nginx.conf /etc/nginx/
COPY    /requirements/nginx/tools/ssl /etc/nginx/
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]