python-pip:
  pkg.installed

docker.io:
  pkg.installed

prepare:
  service.running:
    - name: docker
    - require:
      - pkg: docker.io

  pip.installed:
    - name: docker
    - require:
      - pkg: python-pip
