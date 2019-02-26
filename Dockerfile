#
# This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.
#

FROM debian:stable-slim
MAINTAINER Bob <kcey@mail.ru>

RUN export DEBIAN_FRONTEND=noninteractive \
&& export URL=https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest \
&& export OS="linux" \
&& apt-get update && apt-get upgrade -y \
&& apt-get install --no-install-recommends -y ca-certificates wget curl \
&& cd /opt \
&& wget --tries=3 $(curl -s $URL | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(dpkg --print-architecture)" | grep -m 1 -i "$(echo $OS)") \
&& tar -xvzf *.tar.gz \
&& rm *.tar.gz \
&& mkdir /opt/AdGuardHome/data \
&& apt-get purge -y -q --auto-remove wget curl \
&& apt-get clean \
&& cd / \
&& rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

VOLUME [ "/opt/AdGuardHome/data" ]

EXPOSE 53/tcp 53/udp 67/tcp 67/udp 68/tcp 68/udp 80/tcp 443/tcp 853/tcp 853/udp 3000/tcp

ENTRYPOINT ["/opt/AdGuardHome/AdGuardHome"]
CMD ["-h", "0.0.0.0", "-c", "/opt/AdGuardHome/data/AdGuardHome.yaml", "-w", "/opt/AdGuardHome/data"]
