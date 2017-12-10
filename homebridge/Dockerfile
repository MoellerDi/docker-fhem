FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV NODE_ENV production

# Install dependencies
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends \
	apt-utils \
	xz-utils \
	wget python \
	libavahi-compat-libdnssd-dev \
	make \
	gcc \
	g++

RUN wget https://nodejs.org/dist/v6.9.2/node-v6.9.2-linux-x64.tar.xz -P /tmp && \
	cd /usr/local && \
	tar -xvf /tmp/node-v6.9.2-linux-x64.tar.xz --strip=1 && \
	ln -s /usr/local/bin/node /usr/bin/node

RUN npm install -g homebridge homebridge-fhem homebridge-http

COPY config.json ./.homebridge/

RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

EXPOSE 51826

WORKDIR "/root"
COPY start.sh ./
RUN chmod +x ./start.sh

CMD ./start.sh