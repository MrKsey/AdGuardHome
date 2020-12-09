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


























2020-11-20 10:40:04: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.104.3:

Bugfixes... 😌 There's something about them that we just can't resist. We always want more! 🧟 

When there's nothing more to fix, we just roll out a new major update, introduce some fresh bugs and start all over. It's a circle of life ☯️

Luckily, there are still some to prey upon in v0.104. Have a look at what we've fixed this time:

##  Fixed

 *  Don't expose the profiler HTTP API (#2336).
 *  Load query logs from files after loading the ones buffered in memory (#2325).
 *  Don't show Unnecessary errors in logs when switching between query log files (#2324).
 *  Don't show `404 Not Found` errors on the DHCP settings page on *Windows*.  Show that DHCP is not currently available on that OS instead (#2295).
 *  Fix an infinite loop in the `/dhcp/find_active_dhcp` HTTP API method (#2301).
 *  Various internal improvements.
