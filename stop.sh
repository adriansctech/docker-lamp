#!/bin/bash
echo "*********************************************"
echo "******create backup of apache logs now ******"
echo "*********************************************"
pkill -9 tail
cp apache-logs/access.log apache-logs/$( date '+%Y-%m-%d-%H-%M' )-access.log
cp apache-logs/error.log apache-logs/$( date '+%Y-%m-%d-%H-%M' )-error.log
yes | mv apache-logs/????-??-??-??-??-access.log apache-logs/old-logs/
yes | mv apache-logs/????-??-??-??-??-error.log apache-logs/old-logs/
docker-compose stop