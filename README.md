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
2021-05-19 13:38:41: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.106.3:

More! More bugfixes! 🧟‍♀️

But this time, for a change, there's a couple of new minor features to go with them. Hope you don't mind 🤷‍♂️

A special thanks to our open-source contributor, @ashishwt, as well as to everyone who filed and inspected issues, added translations, and helped us to test this release!

### Added

- Support for reinstall (`-r`) and uninstall (`-u`) flags in the installation script (#2462).
- Support for DHCP `DECLINE` and `RELEASE` message types (#3053).

### Changed

- Add microseconds to log output.

### Fixed

- Intermittent "Warning: ID mismatch" errors (#3087).
- Error when using installation script on some ARMv7 devices (#2542).
- DHCP leases validation (#3107, #3127).
- Local PTR request recursion in Docker containers (#3064).
- Ignoring client-specific filtering settings when filtering is disabled in general settings (#2875).
- Disallowed domains are now case-insensitive (#3115).
- Other minor fixes and improvements.
