# AdGuardHome
### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* server with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* create "/AdGuardHome" directory (for example) on your host.
* create container from docker image "ksey/adguardhome", connect host "/AdGuardHome" directory to the container directory "/etc/AdGuardHome" and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d \
-p 3000:3000 \
-p 53:53/udp \
-v /AdGuardHome:/etc/AdGuardHome ksey/adguardhome
```
