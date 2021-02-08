FROM pihole/pihole

LABEL maintainer="github@shaf.net" \
        image="shaf/pi-hole-tcp" \
        url="https://github.com/shaf/docker-pi-hole-tcp" \
        credits="https://www.github.com/pi-hole/docker-pi-hole"

ENV PATCHED="2020-02-08" \
    DNSF1="8.8.8.8" \
    DNSF2="8.8.4.4" \
    DNS1="127.0.0.1#5444" \
    DNS2="127.0.0.1#5445"

RUN apt-get update && cd / && git clone https://github.com/shaf/utdns \
    && cd /utdns && chmod +x configure \
    && apt-get -y install g++ make && ./configure && make -j `nproc` \
    && apt-get -y purge --auto-remove g++ make && apt-get clean && echo processors=`nproc`

ADD dns1 /etc/services.d/dns1
ADD dns2 /etc/services.d/dns2