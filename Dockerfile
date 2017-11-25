FROM arm64v8/node:latest

COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y git build-essential sudo

RUN git clone git://git.drogon.net/wiringPi

WORKDIR wiringPi

RUN ./build

RUN npm install rpi-433

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root
