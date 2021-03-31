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
2021-03-30 10:52:07: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.106.0-b.1:

Changes compared to v0.105.2.  See [CHANGELOG.md] for all changes.

### Added

- The ability to set a custom TLD for known local-network hosts (#2393).
- The ability to serve DNS queries on multiple hosts and interfaces (#1401).
- `ips` and `text` DHCP server options (#2385).
- `SRV` records support in `$dnsrewrite` filters (#2533).

### Changed

- Stricter validation of the IP addresses of static leases in the DHCP server with regards to the netmask (#2838).
- Stricter validation of `$dnsrewrite` filter modifier parameters (#2498).
- New, more correct versioning scheme (#2412).

### Deprecated

- Go 1.15 support.  v0.107.0 will require at least Go 1.16 to build.

### Fixed

- Support for more than one `/24` subnet in DHCP (#2541).
- Invalid filenames in the `mobileconfig` API responses (#2835).

### Removed

- Go 1.14 support.

[CHANGELOG.md]: https://github.com/AdguardTeam/AdGuardHome/tree/v0.106.0-b.1/CHANGELOG.md
