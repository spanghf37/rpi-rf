FROM hypriot/rpi-node

COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get update -y \
    && apt-get upgrade -y \
    && git clone git://git.drogon.net/wiringPi \
    && cd wiringPi \
    && ./build
    
RUN npm install rpi-433

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root

CMD ["npm","start"]
