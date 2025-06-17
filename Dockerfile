FROM ubuntu:20.04
MAINTAINER harsh@amarinfotech.com

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt update && \
    apt install -y tzdata apache2 zip unzip curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download and unzip Ethereal template
WORKDIR /var/www/html

RUN curl -L https://codeload.github.com/html5up-nsm-templates/ethereal/zip/refs/heads/master -o ethereal-master.zip && \
    unzip ethereal-master.zip && \
    cp -rvf ethereal-master/* . && \
    rm -rf ethereal-master.zip ethereal-master

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
