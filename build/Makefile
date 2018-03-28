box:
	vargant up

erlang:
	wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O /tmp/erlang-solutions_1.0_all.deb
	dpkg -i /tmp/erlang-solutions_1.0_all.deb
	apt-get update
	apt-get install -y erlang

git:
	apt-get install -y git

docker:
	apt-get install -y docker.io

rebar3:
	git clone https://github.com/erlang/rebar3.git /tmp/rebar3
	cd /tmp/rebar3
	./bootstrap
	install -v rebar3 /usr/local/bin/

build_app:
	git clone https://github.com/Antibiotic/websocket_chat.git /tmp/websocket_chat
	cd /tmp/websocket_chat
	grep -q relx rebar.config || cat ../guacamole4/build/rebar-relx.config >> rebar.config
	make compile
	rebar3 release

build_image:
	docker build -t freddygood/guacamole4:latest -f guacamole4/build/Dockerfile .

push_image:
	docker login
	docker push freddygood/guacamole4:latest

prepare: erlang git docker rebar3

build: build_app build_image

all: prepare build

push: all push_image

