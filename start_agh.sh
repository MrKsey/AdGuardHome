#!/bin/sh

if [ ! -e /etc/AdGuardHome/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /etc/AdGuardHome/AdGuardHome.yaml
fi

/opt/AdGuardHome/AdGuardHome -c /etc/AdGuardHome/AdGuardHome.yaml
