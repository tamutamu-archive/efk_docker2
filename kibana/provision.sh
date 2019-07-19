#!/bin/bash
##set -eux


# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

# Install OpenJDK8
apt install -y apt-transport-https


# Install Elasticsearch7
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
apt update

apt install -y kibana

cat << EOT >> /etc/kibana/kibana.yml

server.host: "0.0.0.0"
elasticsearch.hosts: ["http://elasticsearch:9200"]
EOT

systemctl enable kibana
