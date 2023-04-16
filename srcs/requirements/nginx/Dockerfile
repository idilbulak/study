FROM	alpine:3.15
RUN		apk update && apk upgrade && \
    	apk add --no-cache nginx
COPY    /requirements/nginx/conf/nginx.conf /etc/nginx/conf.d/
COPY    /requirements/nginx/tools/cert/* /etc/nginx/ssl/
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]