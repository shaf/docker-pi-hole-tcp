# Docker Pi-hole (tcp)

Circumventing ISPs that ban you from using your own DNS name servers like VodafoneUK connect

Extends diginc/pi-hole to query forwarded requests over tcp only instead of the default udp.

This enables us to reach public DNS servers that would normally be blocked by ISPs like Vodafone UK

#### Environment

- `DNSF1` , `DNSF2`
        - Nameserver address to use instead of the usual DNS1 and DNS2

Do not override variables DNS1 and DNS2

#### Usage

```sh
# Defaults to Google nameservers
#
docker run --name pihole -e ServerIP=192.168.1.66 --rm shaf/pi-hole-tcp

# OpenDNS FamilyShield
# 
docker run -d --name pihole \
        -p ${our_ip}:80:80/tcp \
        -p ${our_ip}:53:53/tcp \
        -p ${our_ip}:53:53/udp \
        -e ServerIP="${our_ip}" \
        -e DNSF1="208.67.222.123" \
        -e DNSF2="208.67.220.123" \
        -e WEBPASSWORD="my_password" \
        shaf/pi-hole-tcp

# DNSSEC with via https://dns.watch/why
#
docker run -d --name pihole \
        -p ${our_ip}:80:80/tcp \
        -p ${our_ip}:53:53/tcp \
        -p ${our_ip}:53:53/udp \
        -e ServerIP="${our_ip}" \
        -e DNSF1="84.200.69.80" \
        -e DNSF2="84.200.70.40" \
	-e DNSSEC=true \
        -e WEBPASSWORD="my_password" \
        shaf/pi-hole-tcp
```
