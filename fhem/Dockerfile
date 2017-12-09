FROM debian:jessie

ENV FHEM_VERSION 5.8
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-utils \
	apt-transport-https \
	build-essential \
	dfu-programmer \
	etherwake \
	git \
	perl \
	snmp \
	snmpd \
	sqlite3 \
	sudo \
	telnet \
	usbutils \
	vim \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# Install perl packages
RUN apt-get update && apt-get -y install \
	libalgorithm-merge-perl \
	libauthen-oath-perl \
	libavahi-compat-libdnssd-dev \
	libcgi-pm-perl \
	libclass-dbi-mysql-perl \
	libclass-isa-perl \
	libcommon-sense-perl \
	libconvert-base32-perl \
	libcrypt-urandom-perl \
	libdata-dump-perl \
	libdatetime-format-strptime-perl \
	libdbd-sqlite3-perl \
	libdbi-perl \
	libdevice-serialport-perl \
	libdpkg-perl \
	liberror-perl \
	libfile-copy-recursive-perl \
	libfile-fcntllock-perl \
	libgd-graph-perl \
	libgd-text-perl \
	libimage-info-perl \
	libimage-librsvg-perl \
	libio-socket-inet6-perl \
	libio-socket-ip-perl \
	libio-socket-multicast-perl \
	libio-socket-ssl-perl \
	libjson-perl \
	libjson-xs-perl \
	liblist-moreutils-perl \
	libmail-imapclient-perl \
	libmail-sendmail-perl \
	libmime-base64-perl \
	libnet-telnet-perl \
	libsoap-lite-perl \
	libsocket-perl \
	libsocket6-perl \
	libswitch-perl \
	libsys-hostname-long-perl \
	libterm-readkey-perl \
	libterm-readline-perl-perl \
	libtext-csv-perl \
	libtext-diff-perl \
	libtimedate-perl \
	libwww-perl \
	libxml-simple-perl \
	&& rm -rf /var/lib/apt/lists/*

# set timezone
RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure tzdata

# Install fhem
RUN wget https://fhem.de/fhem-${FHEM_VERSION}.deb && \
    dpkg -i fhem-${FHEM_VERSION}.deb && \
    rm -f fhem-${FHEM_VERSION}.deb && \
    userdel fhem

# Some additions to the standard fhem.cfg
RUN echo 'attr global    nofork     1\n'    >> /opt/fhem/fhem.cfg && \
    echo 'attr WEB       editConfig 1\n'    >> /opt/fhem/fhem.cfg && \
    echo 'attr WEB       csrfToken  none\n' >> /opt/fhem/fhem.cfg && \
    echo 'attr WEBphone  csrfToken  none\n' >> /opt/fhem/fhem.cfg && \
    echo 'attr WEBtablet csrfToken  none\n' >> /opt/fhem/fhem.cfg


#### docker stuff ####

WORKDIR "/opt/fhem"

EXPOSE 8083 8084 8085 7072

COPY entry.sh /root/
RUN chmod +x /root/entry.sh

ENTRYPOINT ["/root/entry.sh"]
CMD ["fhem.cfg"]
