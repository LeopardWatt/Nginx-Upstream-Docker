FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y wget curl htop mc mcedit ncdu git zip unzip && \
	cd /opt && \    
    git clone https://github.com/LeopardWatt/Nginx-Upstream-Docker.git && \
    cd Nginx-Upstream-Docker/deb \
    unzip nginx-upstream.zip -d / \
    cd /opt && \
    apt-get install -y iproute2 \
    dpkg -i /opt/nginx-common_1.14.0-0ubuntu1.11_all.deb \
    apt --fix-broken install -y \
    dpkg -i /opt/nginx-core_1.14.0-0ubuntu1.11_amd64.deb 
    #dpkg -i /opt/libnginx-mod-http-geoip_1.14.0-0ubuntu1.11_amd64.deb \
    #dpkg -i /opt/libnginx-mod-http-image-filter_1.14.0-0ubuntu1.11_amd64.deb \
    #dpkg -i /opt/libnginx-mod-http-xslt-filter_1.14.0-0ubuntu1.11_amd64.deb \
    #dpkg -i /opt/libnginx-mod-mail_1.14.0-0ubuntu1.11_amd64.deb \
    #dpkg -i /opt/libnginx-mod-stream_1.14.0-0ubuntu1.11_amd64.deb \
    #dpkg -i /opt/nginx-common_1.14.0-0ubuntu1.11_all.deb \


##RUN rm -rf /etc/nginx/conf.d/default.conf
##COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]