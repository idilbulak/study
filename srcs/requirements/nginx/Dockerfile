FROM	alpine:3.15
RUN		apk update && apk upgrade && \
    	apk add --no-cache nginx && \
		mkdir -p /run/nginx
COPY    ./conf/nginx.conf /etc/nginx/conf.d/
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]