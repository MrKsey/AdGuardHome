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


### AdguardTeam/AdGuardHome last release:
2021-02-15 19:24:31: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.105.1:

Have you ever thought about why traditions are so important?🧙‍♂️ Traditions help us remember that we are part of a history that defines our past, shapes who we are today, and who we are likely to become. This is why we at AdGuard respect our traditions, and the most important one is pushing the inevitable hotfix right after every major update.🔥🔧

Jokes aside, here's the list of things fixed and improved in this hotfix.

### Changed

- Increased HTTP API timeouts (#2671, #2682).
- "Permission denied" errors when checking if the machine has a static IP no longer prevent the DHCP server from starting (#2667).
- The server name sent by clients of TLS APIs is not only checked when `strict_sni_check` is enabled (#2664).
- HTTP API request body size limit for the `POST /control/access/set` and `POST /control/filtering/set_rules` HTTP APIs is increased (#2666, #2675).

### Fixed

- Error when enabling the DHCP server when AdGuard Home couldn't determine if the machine has a static IP.
- Optical issue on custom rules (#2641).
- Occasional crashes during startup.
- The field `"range_start"` in the `GET /control/dhcp/status` HTTP API response is now correctly named again (#2678).
- DHCPv6 server's `ra_slaac_only` and `ra_allow_slaac` settings aren't reset to `false` on update any more (#2653).
- The `Vary` header is now added along with `Access-Control-Allow-Origin` to prevent cache-related and other issues in browsers (#2658).
- The request body size limit is now set for HTTPS requests as well.
- Incorrect version tag in the Docker release (#2663).
- DNSCrypt queries weren't marked as such in logs (#2662).
