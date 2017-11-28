FROM hypriot/rpi-node

COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get update -y \
    && apt-get upgrade -y \
    && git clone git://git.drogon.net/wiringPi \
    && cd wiringPi && ./build \
    && npm install rpi-433 \
    && mkdir /etc/wiringpi \
    && cd /etc/wiringpi \
    && curl https://raw.githubusercontent.com/sakaki-/rpi3-overlay/master/dev-embedded/wiringpi/files/cpuinfo-1 -o cpuinfo

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root

CMD ["npm","start"]
