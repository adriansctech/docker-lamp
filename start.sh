#!/bin/bash
docker-compose up -d
if [ -s apache-logs/error.log ]
then
		echo "***************************************"
		echo "**** Display error log in real time ***"
		echo "****************************************"
        tail -f apache-logs/error.log
        xdg-open http:localhost
else
		echo "****************************************"
		echo "**** Display access log in real time ***"
		echo "****************************************"
    	tail -f apache-logs/access.log
    	xdg-open http:localhost
fi
