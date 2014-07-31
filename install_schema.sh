#!/bin/sh
IP=`hostname --ip-address`
echo "***My IP: $IP"

echo "*** My Config:"
cat $CONFIG

echo "*** Cleaning up log files"
rm -v /var/log/cassandra/*

echo "*** Starting Cassandra"
#/etc/init.d/cassandra start
#/usr/local/bin/start &
service cassandra start

echo "*** Wait for Cassandra to boot"
until grep -m1 -q "9160" /var/log/cassandra/system.log
do
  echo "..Wait for Cassandra"
  sleep 2
done
echo "**** Cassandra is live!"

echo "*** Importing Schema"
cassandra-cli -host localhost -port 9160 -f /root/cassandra-schema.txt
echo "*** Stopping Cassandra"
service cassandra stop
