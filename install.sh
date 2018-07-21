#!/bin/bash
# git clone https://github.com/taichunmin/docker-terraria.git
set -euxo pipefail
cd "$(dirname "$0")"

sudo apt-get update -qq && sudo apt-get upgrade -y

if [ ! "$(docker -v)" ]; then
  curl -sSL get.docker.com | sh
  sudo usermod -aG docker $USER
fi

if [ ! "$(docker-compose -v)" ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

if [ ! -f .env ]; then
  cp .env.example .env
fi

if [ ! -f serverconfig.txt ]; then
  cp serverconfig.example.txt serverconfig.txt
fi

sudo docker-compose pull