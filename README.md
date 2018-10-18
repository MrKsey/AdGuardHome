# AdGuardHome
### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* host with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* docker host ip (for example) - 192.168.1.10 .
* create "/AdGuardHome" directory on your docker host.
* create container from docker image "ksey/adguardhome", connect host "/AdGuardHome" directory to the container directory "/opt/AdGuardHome/config" and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/config ksey/adguardhome
```
# #
### AdguardTeam/AdGuardHome last release:
2018-10-18 13:25:12: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.9-hotfix1:

🛠️Wow, we've reached another milestone - the first hotfix for AdGuard Home! 🛠️

It fixes a commonly-reported day1 issue: "unable to connect to port 8618", and allows running the binary when working directory is not where the binary is located. It is distributed as a standalone binary. 

* To install, download the correct archive for your operating system and architecture, extract the files and [follow the installation instructions](https://github.com/AdguardTeam/AdGuardHome#how-to-run).
* To update, stop AdGuardHome, unpack the archive, replace the binary, and start it again it.

Fixed:
* #378 — error 127.0.0.1:8618
* #389 — Couldn't get stats error
* #381 — yaml config not applied
* #377 — add docker image.

If you encounter any problems or have suggestions, feel free to [open a new issue in this repo](
https://github.com/AdguardTeam/AdGuardHome/issues).

*We will now take us some time to plan and prepare the next update. Thank you all for lots of valuable feedback we received!*
