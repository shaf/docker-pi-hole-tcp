FROM diginc/pi-hole:alpine

MAINTAINER Shaf Ali "github@shaf.net"

ENV PATCHED="2017-10-11" \
    DNSF1="8.8.8.8" \
    DNSF2="8.8.4.4" \
    DNS1="127.0.0.1#5444" \
    DNS2="127.0.0.1#5445"

RUN apk update && cd / && git clone https://github.com/shaf/utdns \
    && cd /utdns && chmod +x configure \
    && apk del dnsmasq; apk add dnsmasq-dnssec g++ make && ./configure && make -j `nproc` \
    && apk del g++ make \
    && sed -i -e 's/^setup_dnsmasq ".*/setup_dnsmasq "127.0.0.1#5444" "127.0.0.1#5445"/' /start.sh

ADD dns1 /etc/services.d/dns1
ADD dns2 /etc/services.d/dns2
