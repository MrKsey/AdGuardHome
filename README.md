# AdGuardHome
### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* server with docker
* ~128 Mb RAM, ~100 Mb disk space 

### Installing

Create any directory (like /host/AdGuardHome) and connect this directory to the container directory "/etc/AdGuardHome":
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 3000:3000 -p 53:53 -v /host/AdGuardHome:/etc/AdGuardHome ksey/adguardhome
```
