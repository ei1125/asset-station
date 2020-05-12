#!/bin/sh

/usr/local/bin/docker-compose -f /var/www/asset-station/docker-compose.yml down

/usr/local/bin/docker-compose -f /var/www/asset-station/docker-compose.yml up -d