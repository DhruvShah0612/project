FROM ubuntu:20.04
MAINTAINER harsh@amarinfotech.com
 
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt update && \
    apt install -y tzdata apache2 zip unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
 
# Download GitHub zip (you can rename it while downloading)
ADD https://html5up.net/paradigm-shift/download /var/www/html/html5up-paradigm-shift.zip
 
WORKDIR /var/www/html
 
RUN unzip html5up-paradigm-shift.zip && \
    cp -rvf html5up-paradigm-shift.zip /* . && \
    rm -rf html5up-paradigm-shift.zip  html5up-paradigm-shift
 
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
