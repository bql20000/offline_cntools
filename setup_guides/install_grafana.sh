wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo 'deb https://packages.grafana.com/oss/deb stable main' > grafana.list

sudo mv grafana.list /etc/apt/sources.list.d/grafana.list

sudo apt-get update && sudo apt-get install -y grafana

sudo systemctl enable grafana-server.service
