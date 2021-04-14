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
2021-04-14 12:55:03: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.106.0-b.2:

Changes compared to the previous beta, v0.106.0-b.1.  See [CHANGELOG.md] for all changes.

### Added

- New flag `--no-etc-hosts` to disable client domain name lookups in the operating system's /etc/hosts files (#1947).
- The ability to set up custom upstreams to resolve PTR queries for local addresses and to disable the automatic resolving of clients' addresses (#2704).
- Logging of the client's IP address after failed login attempts (#2824).
- Search by clients' names in the query log (#1273).
- Verbose version output with `-v --version` (#2416).

### Changed

- Normalization of hostnames with spaces sent by DHCP clients (#2945).
- The access to the private hosts is now forbidden for users from external networks (#2889).
- The reverse lookup for local addresses is now performed via local resolvers (#2704).
- Stricter validation of the IP addresses of static leases in the DHCP server with regards to the netmask (#2838).
- Stricter validation of `$dnsrewrite` filter modifier parameters (#2498).

### Fixed

- Comment handling in clients' custom upstreams (#2947).
- Overwriting of DHCPv4 options when using the HTTP API (#2927).
- Assumption that MAC addresses always have the length of 6 octets (#2828).
- Various other bugs.

[CHANGELOG.md]: https://github.com/AdguardTeam/AdGuardHome/tree/v0.106.0-b.2/CHANGELOG.md
