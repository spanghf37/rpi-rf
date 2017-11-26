FROM hypriot/rpi-node

COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update -y

RUN apt-get upgrade -y

RUN git clone git://git.drogon.net/wiringPi

RUN cd wiringPi && curl https://raw.githubusercontent.com/sakaki-/rpi3-overlay/master/dev-embedded/wiringpi/files/2.44-pseudo-cpuinfo.patch
 -o 2.44-pseudo-cpuinfo.patch && git apply 2.44-pseudo-cpuinfo.patch
 
RUN cd wiringPi && ./build

RUN npm install rpi-433

RUN cd /etc/wiringpi && curl https://raw.githubusercontent.com/sakaki-/rpi3-overlay/master/dev-embedded/wiringpi/files/cpuinfo-1 -o "cpuinfo"

WORKDIR /home/node/app

VOLUME [ "/home/node/app" ]

USER root

CMD ["npm","start"]
