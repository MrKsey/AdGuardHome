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



























# #
### AdguardTeam/AdGuardHome last release:
2021-03-10 14:39:28: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.105.2:

There are big flashy updates, and there are seemingly unassuming ones, which constitute, however, the backbone of any successful project. This is the latter, as you may have guessed. You'll find here a heap of bugfixes and a security update for [CVE-2021-27935](https://nvd.nist.gov/vuln/detail/CVE-2021-27935).

### Security

- Session token doesn't contain user's information anymore (#2470).

### Fixed

- Incomplete hostnames with trailing zero-bytes handling (#2582).
- Wrong DNS-over-TLS ALPN configuration (#2681).
- Inconsistent responses for messages with EDNS0 and AD when DNS caching is enabled (#2600).
- Incomplete OpenWRT detection (#2757).
- DHCP lease's `expired` field incorrect time format (#2692).
- Incomplete DNS upstreams validation (#2674).
- Wrong parsing of DHCP options of the `ip` type (#2688).
