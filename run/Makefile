up:
	vagrant up

down:
	vagrant destroy -f

pre-salt:
	mkdir -p /srv/salt
	cp /tmp/guacamole4/run/salt/*.sls /srv/salt/
	salt-key -y -a salt-minion

prepare:
	salt salt-minion state.sls prepare

run:
	salt salt-minion state.sls run

all: pre-salt prepare run
