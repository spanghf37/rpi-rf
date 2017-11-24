FROM arm64v8/node:latest

RUN git clone git://git.drogon.net/wiringPi

WORKDIR wiringPi/wiringPi 

RUN ./build

RUN npm install rpi-433

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root
