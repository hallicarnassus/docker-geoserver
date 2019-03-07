#!/bin/bash
docker run --net=host \
    -v /srv/data/import:/data \
    geodata/gdal webmapp/gdal-docker \
    ogr2ogr -f "PostgreSQL" PG:"host=172.17.0.2 user=docker dbname=gis password=docker" \
    RR_FSA.geojson \
    -nln FSA \
    -lco PG_USE_COPY=yes \
    -lco LAUNDER=NO \
    -skipfailures \
    -progress \
    -nlt POLYGON \
    --debug ON