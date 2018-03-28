up:
	vagrant up

down:
	vagrant destroy -f

salt:
	mkdir /srv/salt
	cp /tmp/guacamole4/run/salt/*.sls /srv/salt/
	salt-key -a salt-minion
	salt-key -L

prepare:
	salt salt-minion state.sls prepare

run:
	salt salt-minion state.sls run

all: salt prepare run
