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















































































































2021-04-19 15:25:53: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.106.0-b.3:

Changes compared to the previous beta, v0.106.0-b.2.  See [CHANGELOG.md] for all changes.

### Added

- Hostname generating for DHCP clients which don't provide their own (#2723).
- The ability to set a custom TLD or domain name for known hosts in the local network (#2393, #2961).

### Changed

- Quality of logging (#2954).
- Normalization of hostnames sent by DHCP clients (#2952).

### Fixed

- A bug in `--no-etc-hosts` handling that removed permanent clients (#2956).
- Inconsistent resolving of DHCP clients when the DHCP server is disabled (#2934).

[CHANGELOG.md]: https://github.com/AdguardTeam/AdGuardHome/tree/v0.106.0-b.3/CHANGELOG.md
