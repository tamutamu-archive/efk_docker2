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

apt install -y elasticsearch

/usr/share/elasticsearch/bin/elasticsearch-plugin  install analysis-kuromoji

cat << EOT >> /etc/elasticsearch/elasticsearch.yml


cluster.name: "docker-cluster"
network.host: 0.0.0.0
discovery.type: single-node
xpack.license.self_generated.type: trial
xpack.security.enabled: false
xpack.monitoring.collection.enabled: true
EOT

systemctl enable elasticsearch
