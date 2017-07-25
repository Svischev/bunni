#!/bin/sh
server=rabbitmq-server
ctl=rabbitmqctl
delay=3

echo "[Configuration] $(eval cat $RABBITMQ_CONFIG_FILE.config)"

echo '[Configuration] Starting RabbitMQ in detached mode.'

$server -detached

echo "[Configuration] Waiting $delay seconds for RabbitMQ to start."

sleep $delay

echo '*** Creating users ***'
$ctl add_user bunni_gem bunni_password
$ctl add_user bunni_reader reader_password

echo '*** Creating virtual hosts ***'
$ctl add_vhost bunni_testbed

echo '*** Setting virtual host permissions ***'
$ctl set_permissions -p / guest '.*' '.*' '.*'
$ctl set_permissions -p bunni_testbed bunni_gem '.*' '.*' '.*'
$ctl set_permissions -p bunni_testbed guest '.*' '.*' '.*'
$ctl set_permissions -p bunni_testbed bunni_reader '^---$' '^---$' '.*'

$ctl stop

echo "[Configuration] Waiting $delay seconds for RabbitMQ to stop."

sleep $delay

echo 'Starting RabbitMQ in foreground (CTRL-C to exit)'

exec $server
