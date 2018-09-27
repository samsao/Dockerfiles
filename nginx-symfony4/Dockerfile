## Base Image

FROM nginx:1.15-alpine

## Environment Substitution

RUN apk add --no-cache curl && \
    curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/1.0.0-RC1/ep-linux && \
    chmod +x /usr/local/bin/ep

## Ports

EXPOSE 80
EXPOSE 443

## Nginx Configuration

RUN mkdir -p /etc/nginx/helpers/block \
             /etc/nginx/helpers/location \
             /etc/nginx/helpers/server \
             /etc/nginx/ssl

### Main

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/mime.types /etc/nginx/mime.types

### Helpers

COPY config/helpers/ /etc/nginx/helpers/

### Site

COPY config/site/ /etc/nginx/conf.d/

### SSL

COPY config/ssl/dhparam4096.pem /etc/nginx/ssl/dhparam4096.pem

## Command

CMD [ "/usr/local/bin/ep", "-v", "/etc/nginx/conf.d/default.conf", "--", "/usr/sbin/nginx", "-g", "daemon off;" ]
