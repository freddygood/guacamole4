FROM ubuntu:xenial
MAINTAINER Fedor Patrakov <freddy-good@yandex.ru>

ENV USER=app
ENV GROUP=app
ENV UID=1000
ENV GID=1000
ENV APP_HOME=/opt/websocket-app
ENV APP_PORT=8080

RUN groupadd -g ${GID} ${GROUP} \
    && useradd -d "${APP_HOME}" -u "${UID}" -g "${GID}" -m -s /bin/bash "${USER}"

RUN apt-get update \
    && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*

USER ${USER}

WORKDIR ${APP_HOME}

ADD ../websocket_chat/_build/default/rel/app ./

EXPOSE ${APP_PORT}

CMD bin/app foreground