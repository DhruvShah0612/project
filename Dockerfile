FROM ubuntu:20.04
MAINTAINER harsh@amarinfotech.com

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and utilities
RUN apt update && \
    apt install -y tzdata apache2 zip unzip curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download the Massively theme ZIP file (named massively-master.zip)
ADD https://codeload.github.com/html5up-nsm-templates/massively/zip/refs/heads/master /var/www/html/massively-master.zip

WORKDIR /var/www/html

# Unzip and copy content from massively-master folder
RUN unzip massively-master.zip && \
    cp -rvf massively-master/* . && \
    rm -rf massively-master massively-master.zip

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
