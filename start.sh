#!/bin/bash
docker-compose up -d
xdg-open http:localhost && tail -f apache-logs/error.log
