box:
	vagrant up

sign:
	salt-key -a salt-minion
	salt-key -L

prepare:
	salt salt-minion state.sls prepare

run: sign prepare
	salt salt-minion state.sls run

all: box sign prepare run

