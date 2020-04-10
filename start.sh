#!/bin/bash
docker-compose up -d
if [ -s apache-logs/error.log ]
then
		echo "***************************************"
		echo "**** Display error log in real time ***"
		echo "****************************************"
        xdg-open http:localhost
        tail -f apache-logs/error.log        
else
		echo "****************************************"
		echo "**** Display access log in real time ***"
		echo "****************************************"
    	xdg-open http:localhost
    	tail -f apache-logs/access.log    	
fi
