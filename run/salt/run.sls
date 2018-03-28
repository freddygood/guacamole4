app:
  docker_container.running:
    - image: freddygood/guacamole4:latest
    - port_bindings:
      - 8080:8080
