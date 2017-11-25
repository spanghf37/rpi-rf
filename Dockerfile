FROM arm64v8/node:latest

COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get install -y git build-essential

RUN git clone git://git.drogon.net/wiringPi

WORKDIR wiringPi/wiringPi 

RUN ls

RUN ./build

RUN npm install rpi-433

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root
