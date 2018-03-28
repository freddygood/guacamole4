# guacamole4

### Requirements

Все действия выполняются на виртуальных машинах, т.о. должно быть установлено

- vargant
- virtualbox

Подразумевается, что все команды выполняются относительно корня репозитория

```
git clone https://github.com/freddygood/guacamole4.git
cd guacamole4
```

### Подготовка контейнера

```
cd build
make up
vagrant ssh -c 'cd /tmp/guacamole4/build && sudo make all'
make down
```

Эти команды выполнят

- поднять vagrant-машину
- установить в нее git и make
- выгрузить репозитории
- установить erlang, rebar3
- собрать приложение и релиз
- собрать docker образ
- запушить образ в https://hub.docker.com/r/freddygood/guacamole4/
- удалить vagrant-машину

### Запуск приложения

```
cd run
make up
vagrant ssh salt-master -c 'cd /tmp/guacamole4/run && sudo make all'
```

Эти команды выполнят:

- поднимут vagrant-машины
- установят в них git, salt и make
- выгрузят репозитории
- настроят master и minion, подписать ключ
- выполнят salt state prepare - установка docker и pip
- выполнят salt state run - запуску контейнера

Приложение доступно по http://127.0.0.1:8080

Удалить vagrant-машины:

```
make down
```

### Замечания

- в документации приложения не указано, что нужен rebar3 и что минимальная версия erlang - 19
- в приложении захардкожен порт 8080, по которому приложение стучится по websocket-ам
