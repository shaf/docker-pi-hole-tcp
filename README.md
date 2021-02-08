# Docker Pi-hole (tcp)

For ISP customers who have their DNS requests filtered and blocked

Extends pihole/pihole (previously diginc/pi-hole) to query forwarded requests over tcp only instead of the default udp.



#### Environment

- `DNSF1` , `DNSF2` - Nameserver addresses to use instead of the usual DNS1 and DNS2

Do not override variables DNS1 and DNS2

#### Example Usage

```sh
# Defaults to Google nameservers
#
docker run --name pihole --rm shaf/pi-hole-tcp

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
