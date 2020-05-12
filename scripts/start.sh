#!/bin/sh

docker-compose -f /var/www/asset-station/docker-compose.yml down

docker-compose -f /var/www/asset-station/docker-compose.yml up -d