#!/bin/bash

cd /usr/src/
#curl -O -L https://github.com/grafana/loki/releases/download/v2.9.4/promtail-linux-amd64.zip
#unzip promtail-linux-amd64
#wget https://raw.githubusercontent.com/grafana/loki/main/clients/cmd/promtail/promtail-local-config.yaml

if [ ! -f /usr/src/promtail/promtail-linux-amd64 ]; then sudo cp /srv/shared/external-softwares/promtail/promtail-linux-amd64 /usr/src/promtail/ ; else echo "" ; fi

#if [ ! -f /usr/src/promtail/promtail-local-config.yaml ]; then sudo cp /srv/shared/external-softwares/promtail/promtail-local-config.yaml /usr/src/promtail/ ; else echo ""; fi

if [ ! -f /etc/systemd/system/promtail.service ]; then sudo cp /srv/shared/external-softwares/promtail/promtail.service /etc/systemd/system/ ; echo ""; fi

sudo systemctl enable promtail

sudo service promtail restart
