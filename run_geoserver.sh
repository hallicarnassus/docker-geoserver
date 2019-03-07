#!/bin/bash
docker run --rm --name "k_postgis" -v /srv/data/postgis_k:/var/lib/postgresql -d -t kartoza/postgis:9.6-2.4
docker run --rm --name "k_geoserver" -v /srv/data/geoserver_k:/opt/geoserver/data_dir --link k_postgis:k_postgis -p 8800:8080 -d -t kartoza/geoserver