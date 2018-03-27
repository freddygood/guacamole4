#!/bin/bash

cd /tmp

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb

apt-get update
apt-get install -y git make erlang docker.io

git clone https://github.com/erlang/rebar3.git
pushd rebar3
./bootstrap
install rebar3 /usr/local/bin/
popd

git clone https://github.com/Antibiotic/websocket_chat.git
pushd websocket_chat
grep -q relx rebar.config || cat ../guacamole4/rebar-relx.config >> rebar.config
make compile
rebar3 release
popd

pushd guacamole4
docker build -t freddygood/guacamole4 .
docker login
docker push freddygood/guacamole4
popd
