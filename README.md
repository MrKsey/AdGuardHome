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






















































































































































































































































































2021-06-01 14:01:00: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.107.0-b.1:

### Added

- `darwin/arm64` support (#2443).
- `freebsd/arm64` support (#2441).
- Output of the default addresses of the upstreams used for resolving PTRs for private addresses (#3136).
- Detection and handling of recurrent PTR requests for locally-served addresses (#3185).
- The ability to completely disable reverse DNS resolving of IPs from locally-served networks (#3184).
- New flag `--local-frontend` to serve dinamically changeable frontend files from disk as opposed to the ones that were compiled into the binary.

### Changed

- Permissions on filter files are now `0o644` instead of `0o600` (#3198).

### Deprecated

- Go 1.16 support.  v0.108.0 will require at least Go 1.17 to build.

### Fixed

- Domain name case in responses (#3194).
- Custom upstreams selection for clients with client IDs in DNS-over-TLS and DNS-over-HTTP (#3186).
- Incorrect client-based filtering applying logic (#2875).

### Removed

- Go 1.15 support.
