FROM techniq/rpi-node-wiringpi

COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update -y

RUN apt-get upgrade -y

RUN npm install rpi-433

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root

CMD ["gpio","readall"]
