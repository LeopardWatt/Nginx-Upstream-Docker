FROM nginx

RUN apt-get update && \
    apt-get install -y wget build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev && \
    wget http://nginx.org/download/nginx-1.23.3.tar.gz && \
    tar zxvf nginx-1.23.3.tar.gz && \
    cd nginx-1.23.3 && \
    ./configure --with-http_stub_status_module --with-http_ssl_module --add-module=/usr/src/nginx_upstream_check_module && \
    make && \
    make install

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]