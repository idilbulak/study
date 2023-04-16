FROM	alpine:3.15
RUN		apk update && \
    	apk add --no-cache nginx
COPY	/requirements/nginx/conf/nginx.conf /etc/nginx.nginx.conf	  
COPY	/requirements/nginx/tools/ssl/* /etc/nginx/ssl/	  
EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]