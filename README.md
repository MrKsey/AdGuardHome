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

























































































































































2021-04-28 15:29:14: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.106.0:

Quite a lot of changes this time around, even if there aren't as many standouts as in some of the previous updates. We're sure that you'll be able to find a line or two in the changelog that speaks to you!

And one of the reasons for that is the constant support from the community. 👥👥 Special thanks to our open-source contributors: @jvoisin and @Paraphraser, as well as to everyone who filed issues, added translations, and helped us to test this release! 🙇

### **The ability to set up custom upstreams to resolve PTR queries for local addresses and to disable the automatic resolving of clients' addresses (#2704)**

<img src="https://cdn.adguard.com/public/Adguard/Home/0.106.0/ptr.jpg?1">

This option will improve your DNS privacy when it comes to addressing local resources. Give it a go unless you want to share your private data with googles of the world.

### **Search by clients' names in the query log (#1273)**

<img src="https://cdn.adguard.com/public/Adguard/Home/0.106.0/client-log.jpg">

There's not much that can be said about this feature, it's quite self-explanatory: now you can search up queries by specific clients. 🤷‍♀️

However, we wanted to highlight it anyway since so many of you have asked for it for quite a while. Hopefully, we delivered! 😅


### Added

- The ability to block user for login after configurable number of unsuccessful attempts for configurable time (#2826).
- `$denyallow` modifier for filters (#2923).
- Hostname uniqueness validation in the DHCP server (#2952).
- Hostname generating for DHCP clients which don't provide their own (#2723).
- New flag `--no-etc-hosts` to disable client domain name lookups in the operating system's /etc/hosts files (#1947).
- Logging of the client's IP address after failed login attempts (#2824).
- Verbose version output with `-v --version` (#2416).
- The ability to set a custom TLD or domain name for known hosts in the local network (#2393, #2961).
- The ability to serve DNS queries on multiple hosts and interfaces (#1401).
- `ips` and `text` DHCP server options (#2385).
- `SRV` records support in `$dnsrewrite` filters (#2533).

### Changed

- Our DoQ implementation is now updated to conform to the latest standard [draft][doq-draft-02] (#2843).
- Quality of logging (#2954).
- Normalization of hostnames sent by DHCP clients (#2945, #2952).
- The access to the private hosts is now forbidden for users from external networks (#2889).
- The reverse lookup for local addresses is now performed via local resolvers (#2704).
- Stricter validation of the IP addresses of static leases in the DHCP server with regards to the netmask (#2838).
- Stricter validation of `$dnsrewrite` filter modifier parameters (#2498).
- New, more correct versioning scheme (#2412).

### Deprecated

- Go 1.15 support.  v0.107.0 will require at least Go 1.16 to build.

### Fixed

- Multiple answers for `$dnsrewrite` rule matching requests with repeating patterns in it (#2981).
- Root server resolving when custom upstreams for hosts are specified (#2994).
- Inconsistent resolving of DHCP clients when the DHCP server is disabled (#2934).
- Comment handling in clients' custom upstreams (#2947).
- Overwriting of DHCPv4 options when using the HTTP API (#2927).
- Assumption that MAC addresses always have the length of 6 octets (#2828).
- Support for more than one `/24` subnet in DHCP (#2541).
- Invalid filenames in the `mobileconfig` API responses (#2835).

### Removed

- Go 1.14 support.

[doq-draft-02]: https://tools.ietf.org/html/draft-ietf-dprive-dnsoquic-02
