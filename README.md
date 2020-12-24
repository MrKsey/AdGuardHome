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
2020-12-24 14:51:05: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.105.0-beta.2:

### Added

- `$dnsrewrite` modifier for filters (#2102).
- The host checking API and the query logs API can now return multiple matched rules (#2102).
- Detecting of network interface configured to have static IP address via `/etc/network/interfaces` (#2302).
- DNSCrypt protocol support (#1361).
- A 5 second wait period until a DHCP server's network interface gets an IP address (#2304).
- `$dnstype` modifier for filters (#2337).
- HTTP API request body size limit (#2305).

### Changed

- When `dns.bogus_nxdomain` option is used, the server will now transform responses if there is at least one bogus address instead of all of them (#2394).  The new behavior is the same as in `dnsmasq`.
- Post-updating relaunch possibility is now determined OS-dependently (#2231, #2391).
- Made the mobileconfig HTTP API more robust and predictable, add parameters and improve error response (#2358).
- Improved HTTP requests handling and timeouts (#2343).
- Our snap package now uses the `core20` image as its base (#2306).
- Various internal improvements (#2267, #2271, #2297).

### Fixed

- Inability to set DNS cache TTL limits (#2459).
- Possible freezes on slower machines (#2225).
- A mitigation against records being shown in the wrong order on the query log page (#2293).
- A JSON parsing error in query log (#2345).
- Incorrect detection of the IPv6 address of an interface as well as another infinite loop in the `/dhcp/find_active_dhcp` HTTP API (#2355).
