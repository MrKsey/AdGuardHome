### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

![AdGuardHome](https://raw.githubusercontent.com/MrKsey/AdGuardHome/master/adh.PNG)

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* host with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* docker host ip (for example) - 192.168.1.10 .
* create ```/AdGuardHome``` directory on your docker host.
* create container from docker image "ksey/adguardhome", connect host ```/AdGuardHome``` directory to the container directory ```/opt/AdGuardHome/config``` and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/config ksey/adguardhome
```

* AdGuardHome DNS works on 192.168.1.10, port 53
* Open the browser and navigate to http://192.168.1.10:3000/ to control your AdGuardHome service. Default login and password - ```admin/admin```.
* Edit file ```/AdGuardHome/AdGuardHome.yaml``` (on the host) to change the password and other parameters.




























































































2018-12-30 13:06:07: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.92:

🎄 Looks like Santa hid some late presents under the tree! 🎄

What could be a better time to publish some new hot stuff than the day before New Year's Eve? Jokes aside, we prepared some cool things for you, and we would like to share it before the year ends. So, let's unpack AdGuard Home v0.92 and see what's inside! 

### Reworked DNS server: #450 

🚄 From the very beginning, AdGuard Home was using [CoreDNS](https://github.com/coredns/coredns) under the hood. It is an excellent and flexible DNS server, but time showed that it's a bit too complicated and heavy for the purposes of our product, and that was slowing us down considerably.

🚅 We chose to develop our own simple DNS server which might not be as flexible as CoreDNS, but it perfectly fits our needs. We called it [dnsproxy](https://github.com/AdguardTeam/dnsproxy) and, by the way, you can use it in your own open source projects.

### Windows binaries: #375 

Another issue that was quite hard to solve with CoreDNS is that we couldn't make AdGuard Home work on Windows. Well, this is not a problem anymore! Meet Windows build, finally! 🎉

### DNSCrypt support: #284 

🔐 AdGuard Home now supports every possible DNS encryption protocol, isn't that cool?

In order to use a DNSCrypt resolver, you need to specify its [DNS stamp](https://dnscrypt.info/stamps-specifications/). And [here](https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v2/public-resolvers.md) you can find a list of public secure DNS resolvers, with their DNS stamps.

### Built-in DHCP server: #423 

Not every router allows changing its DHCP/DNS settings so we had to provide an alternative. AdGuard Home can now act as a DHCP server and define itself as the network's DNS server.

😲 **This feature is experimental!** We have not yet fully tested it so it might be unstable. Also, it does not work on Windows.

Besides these new features, here is a [full list](https://github.com/AdguardTeam/AdGuardHome/milestone/5?closed=1) of other bugs and issues resolved in this release.

Happy New Year, everyone!
