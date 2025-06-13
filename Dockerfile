FROM ubuntu:20.04
MAINTAINER harsh@amarinfotech.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y tzdata apache2 zip unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# ⬇️ Download and rename the ZIP as massively-master.zip
ADD https://codeload.github.com/html5up-nsm-templates/massively/zip/refs/heads/master /var/www/html/massively-master.zip

WORKDIR /var/www/html

# ⬇️ Unzip and copy contents of massively-master into web root
RUN unzip massively-master.zip && \
    cp -rvf massively-master/* . && \
    rm -rf massively-master.zip massively-master 

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
