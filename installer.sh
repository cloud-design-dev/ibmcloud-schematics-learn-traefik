#!/usr/bin/env bash

## Update machine
DEBIAN_FRONTEND=noninteractive apt -qqy update
DEBIAN_FRONTEND=noninteractive apt-get -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' dist-upgrade

## Install Docker 
DEBIAN_FRONTEND=noninteractive apt -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' install apt-transport-https ca-certificates curl gnupg-agent software-properties-common openssl

## Register Docker package registry
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
DEBIAN_FRONTEND=noninteractive add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

## Refresh package udpates and install Docker
DEBIAN_FRONTEND=noninteractive apt -qqy update
DEBIAN_FRONTEND=noninteractive apt -qqy -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' install docker-ce docker-ce-cli containerd.io

## Install Traefik
wget https://github.com/containous/traefik/releases/download/v${release}/traefik_v${release}_linux_amd64.tar.gz