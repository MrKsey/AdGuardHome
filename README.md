### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

Official Docker Image for AdGuardHome here - https://hub.docker.com/r/adguard/adguardhome

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

![AdGuardHome](https://raw.githubusercontent.com/MrKsey/AdGuardHome/master/adh.PNG)

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* host with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* docker host ip (for example) - 192.168.1.10 .
* create ```/AdGuardHome``` directory on your docker host for configuration files, filters and data.
* create container from docker image "ksey/adguardhome", connect host ```/AdGuardHome``` directory to the container directory ```/opt/AdGuardHome/data``` and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 192.168.1.10:53:53/tcp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/data --restart always ksey/adguardhome
```

* Open the browser and navigate to http://192.168.1.10:3000/ to control your AdGuardHome service.
* When you run AdGuard Home for the first time, there is a simple configuration wizard.
* Remember to set "Admin Web Interface" port to 3000.
* AdGuardHome DNS works on 192.168.1.10, default port 53.
* Edit file ```/AdGuardHome/AdGuardHome.yaml``` (on the host) to change the password and other parameters.



























































































































2019-11-19 20:50:45: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.99.3:

Move along citizens, nothing to see here 👮‍♂️🤚

Well, except for a regular minor update with a few fixes and improvements.

* Fixed a bunch of query log search issues
* Fixed a couple of crashes
* Some minor improvements

Here's the full changelog:
https://github.com/AdguardTeam/AdGuardHome/milestone/20?closed=1














### AdguardTeam/AdGuardHome last release:
2019-12-25 21:09:41: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.100.8:

Time for Christmas presents 🎄🎉 so here's one more tiny little update!

* Updated translations: #1304
* [Changed] Treat "://example.org" as "||example.org": #1249 
