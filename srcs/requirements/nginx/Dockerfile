# Base image
FROM	alpine:3.15

# Install packages
# (not cache the index locally, save disk space)
# Nginx requires a specific location to store its PID file, which is used by the system to track the process.
RUN		apk update && apk upgrade && \
    	apk add --no-cache nginx
		mkdir -p /run/nginx

# Expose ports
EXPOSE	9000

# Start nginx
CMD		["nginx", "-g", "daemon off;"]