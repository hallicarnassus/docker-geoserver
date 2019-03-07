#!/bin/bash
echo "Fetching all community plugins for GeoServer"
array=(geoserver-${GS_VERSION:0:4}-SNAPSHOT-activeMQ-broker-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-authkey-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-backup-restore-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-colormap-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-dds-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-dyndimension-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gdal-wcs-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gdal-wps-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-geopkg-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gpx-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gwc-distributed-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gwc-s3-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-gwc-sqlite-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-hz-cluster-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-jdbc-metrics-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-jdbcconfig-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-jdbcstore-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-jms-cluster-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-kmlppio-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-mbstyle-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-mbtiles-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-ncwms-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-netcdf-ghrsst-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-notification-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-nsg-wfs-profile-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-nsg-wmts-profile-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-onelogin-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-opensearch-eo-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-ows-simulate-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-params-extractor-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-pgraster-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-python-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-qos-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-s3-geotiff-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-sec-keycloak-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-sec-oauth2-geonode-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-sec-oauth2-github-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-sec-oauth2-google-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-sec-oauth2-openid-connect-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-solr-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-status-monitoring-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-taskmanager-core-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-taskmanager-s3-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-web-resource-browser-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wfs3-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wms-eo-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wmts-multi-dimensional-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wps-download-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wps-jdbc-plugin.zip \
	geoserver-${GS_VERSION:0:4}-SNAPSHOT-wps-remote-plugin.zip )

for i in "${array[@]}"
    do
       	cm_url="https://build.geoserver.org/geoserver/${GS_VERSION:0:4}x/community-latests/${i}"
#	echo ${cm_url}
	echo ${i}
        wget --no-check-certificate -c ${cm_url} -O /tmp/resources/plugins/${i}
    done
