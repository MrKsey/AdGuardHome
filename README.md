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



2020-11-11 13:53:05: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.104.1:

Those who pay close attention to AdGuard Home releases know that we keep hotfixes close to our hearts 🔥♥️ This time we held for as long as we could, but ultimately gave in to the urge 😔

Here's a patch to v0.104 with some fixes and minor improvements.

##  Fixed

 *  Solve the `permission denied` error when launching a DHCP server on *Linux* using *Snap* (#2228).  Users experiencing this issue should refresh their snap and call:
    ```sh
    snap connect adguard-home:network-control
    ```
    This won't be required in the future versions.
 *  Use matching fonts in the *Custom Filters* textarea (#2254).
 *  Show the correct query type for DNS-over-QUIC queries in query log (#2241).
 *  Increase the default number of simultaneous requests to improve performance (#2257).
 *  Always set a secondary DNS in DHCP (#1708).
 *  Improve stability on DNS proxy restart (#2242).
 *  Improve logging on DNS proxy restart (#2252).
 *  Don't show a “Loading” message and don't rerequest logs once we've reached the end of logs on the query log page (#2229).
 *  Various internal improvements.
