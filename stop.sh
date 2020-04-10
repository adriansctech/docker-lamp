#!/bin/bash
echo "*********************************************"
echo "******create backup of apache logs now ******"
echo "*********************************************"
mv apache-logs/access.log apache-logs/$( date '+%Y-%m-%d' )-access.log
mv apache-logs/error.log apache-logs/$( date '+%Y-%m-%d' )-error.log
docker-compose stop