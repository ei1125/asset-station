#!/bin/sh

docker-compose -p project-name -f /var/www/asset-station/docker-compose.yml down

docker-compose -p project-name -f /var/www/asset-station/docker-compose.yml up -d