#!/bin/bash

# GeoServer Extension Plugins
fg_red=`tput setaf 1`
fg_green=`tput setaf 2`
fg_yellow=`tput setaf 3`
fg_blue=`tput setaf 4`
fg_magenta=`tput setaf 5`
fg_cyan=`tput setaf 6`
fg_white=`tput setaf 7`
fg_black=`tput setaf 0`

clr=`tput clear`
rev=`tput rev`
bold_start=`tput smso`
bold_end=`tput rmso`
uline_start=`tput smul`
uline_end=`tput rmul`
reset=`tput sgr0`

# Target Directories
GS_VERSION=2.15.0
EXT_OUTPUT_DIR=/tmp/geoserver/resources/ext_plugins
COMM_OUTPUT_DIR=/tmp/geoserver/resources/comm_plugins

# check if output directory exists, if not create it
echo "${fg_cyan}Check if the output directory exists [${fg_yellow}${EXT_OUTPUT_DIR}${fg_cyan}]${reset}"
if [ ! -d /tmp/geoserver/ ]; then
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_red} Output directory does not exist,${fg_green} building output folder structure...${reset}"
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_yellow} Making temporary /tmp/geoserver folder... ${reset}"
	sudo mkdir /tmp/geoserver
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_yellow} Granting user: ${USER} rights to the download folder... ${reset}"
	sudo chown ${USER} /tmp/geoserver
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_yellow} Making /tmp/geoserver/resources folder... ${reset}"
	mkdir /tmp/geoserver/resources
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_yellow} Making GeoServer v${GS_VERSION} Extension Plugins folder... ${reset}"
	mkdir /tmp/geoserver/resources/ext_plugins
	echo "${fg_cyan}${bold_start}|${bold_end}${fg_yellow} Making Community Plugins folder... ${reset}"
	mkdir /tmp/geoserver/resources/comm_plugins
fi;

tree /tmp/geoserver

array=(geoserver-2.15-SNAPSHOT-app-schema-plugin.zip \
	geoserver-2.15-SNAPSHOT-arcsde-plugin.zip \
	geoserver-2.15-SNAPSHOT-cas-plugin.zip \
	geoserver-2.15-SNAPSHOT-charts-plugin.zip \
	geoserver-2.15-SNAPSHOT-control-flow-plugin.zip \
	geoserver-2.15-SNAPSHOT-css-plugin.zip \
	geoserver-2.15-SNAPSHOT-csw-plugin.zip \
	geoserver-2.15-SNAPSHOT-db2-plugin.zip \
	geoserver-2.15-SNAPSHOT-dxf-plugin.zip \
	geoserver-2.15-SNAPSHOT-excel-plugin.zip \
	geoserver-2.15-SNAPSHOT-feature-pregeneralized-plugin.zip \
	geoserver-2.15-SNAPSHOT-gdal-plugin.zip \
	geoserver-2.15-SNAPSHOT-geofence-plugin.zip \
	geoserver-2.15-SNAPSHOT-geofence-server-plugin.zip \
	geoserver-2.15-SNAPSHOT-grib-plugin.zip \
	geoserver-2.15-SNAPSHOT-h2-plugin.zip \
	geoserver-2.15-SNAPSHOT-imagemap-plugin.zip \
	geoserver-2.15-SNAPSHOT-imagemosaic-jdbc-plugin.zip \
	geoserver-2.15-SNAPSHOT-importer-bdb-plugin.zip \
	geoserver-2.15-SNAPSHOT-importer-plugin.zip \
	geoserver-2.15-SNAPSHOT-inspire-plugin.zip \
	geoserver-2.15-SNAPSHOT-jp2k-plugin.zip \
	geoserver-2.15-SNAPSHOT-libjpeg-turbo-plugin.zip \
	geoserver-2.15-SNAPSHOT-mongodb-plugin.zip \
	geoserver-2.15-SNAPSHOT-monitor-plugin.zip \
	geoserver-2.15-SNAPSHOT-mysql-plugin.zip \
	geoserver-2.15-SNAPSHOT-netcdf-out-plugin.zip \
	geoserver-2.15-SNAPSHOT-netcdf-plugin.zip \
	geoserver-2.15-SNAPSHOT-ogr-wfs-plugin.zip \
	geoserver-2.15-SNAPSHOT-ogr-wps-plugin.zip \
	geoserver-2.15-SNAPSHOT-oracle-plugin.zip \
	geoserver-2.15-SNAPSHOT-printing-plugin.zip \
	geoserver-2.15-SNAPSHOT-pyramid-plugin.zip \
	geoserver-2.15-SNAPSHOT-querylayer-plugin.zip \
	geoserver-2.15-SNAPSHOT-sldservice-plugin.zip \
	geoserver-2.15-SNAPSHOT-sqlserver-plugin.zip \
	geoserver-2.15-SNAPSHOT-teradata-plugin.zip \
	geoserver-2.15-SNAPSHOT-vectortiles-plugin.zip \
	geoserver-2.15-SNAPSHOT-wcs2_0-eo-plugin.zip \
	geoserver-2.15-SNAPSHOT-wps-cluster-hazelcast-plugin.zip \
	geoserver-2.15-SNAPSHOT-wps-plugin.zip \
	geoserver-2.15-SNAPSHOT-xslt-plugin.zip \
	geoserver-2.15-SNAPSHOT-ysld-plugin.zip)

for i in "${array[@]}"
do
    if [ ! -f ${EXT_OUTPUT_DIR}/${i} ]; then
      url="https://build.geoserver.org/geoserver/${GS_VERSION:0:4}.x/ext-latest/${i}"
      echo "${fg_cyan}${bold_start}|${bold_end}${fg_white} Validating url: ${url}"
      if curl -q --output /dev/null --silent --head --fail ${url}; then
        echo "${fg_cyan}${bold_start}|${bold_end}${fg_green} URL valid:${fg_yellow} ${url} ${reset}"
        echo "${fg_cyan}${bold_start}|${bold_end}${fg_green} Downloading Plugin:${fg_cyan} ${i} ${reset}"
        wget -q --show-progress --no-check-certificate -c ${url} -O ${EXT_OUTPUT_DIR}/${i}
      else
        echo "${fg_cyan}${bold_start}|${fg_red} URL does not exist (Error 404)${bold_end}, or there is a connectivity problem: ${fg_yellow}${url}${reset}"
      fi;
    else
      echo "${fg_cyan}${bold_start}|${bg_yellow}${fg_white} File '${fg_magenta}${i}${fg_white}' already exists, moving on...${bold_end}${reset}"
    fi;
done

echo "${bg_yellow}${fg_cyan}${bold_start}|${fg_blue} All GeoServer Extension Plugins downloaded...${bold_end}${reset}"

# GeoServer Community Plugins
comm_array=(geoserver-2.15-SNAPSHOT-activeMQ-broker-plugin.zip \
	geoserver-2.15-SNAPSHOT-authkey-plugin.zip \
	geoserver-2.15-SNAPSHOT-backup-restore-plugin.zip \
	geoserver-2.15-SNAPSHOT-colormap-plugin.zip \
	geoserver-2.15-SNAPSHOT-dds-plugin.zip \
	geoserver-2.15-SNAPSHOT-dyndimension-plugin.zip \
	geoserver-2.15-SNAPSHOT-gdal-wcs-plugin.zip \
	geoserver-2.15-SNAPSHOT-gdal-wps-plugin.zip \
	geoserver-2.15-SNAPSHOT-geopkg-plugin.zip \
	geoserver-2.15-SNAPSHOT-gpx-plugin.zip \
	geoserver-2.15-SNAPSHOT-gwc-distributed-plugin.zip \
	geoserver-2.15-SNAPSHOT-gwc-s3-plugin.zip \
	geoserver-2.15-SNAPSHOT-gwc-sqlite-plugin.zip \
	geoserver-2.15-SNAPSHOT-hz-cluster-plugin.zip \
	geoserver-2.15-SNAPSHOT-jdbc-metrics-plugin.zip \
	geoserver-2.15-SNAPSHOT-jdbcconfig-plugin.zip \
	geoserver-2.15-SNAPSHOT-jdbcstore-plugin.zip \
	geoserver-2.15-SNAPSHOT-jms-cluster-plugin.zip \
	geoserver-2.15-SNAPSHOT-kmlppio-plugin.zip \
	geoserver-2.15-SNAPSHOT-mbstyle-plugin.zip \
	geoserver-2.15-SNAPSHOT-mbtiles-plugin.zip \
	geoserver-2.15-SNAPSHOT-ncwms-plugin.zip \
	geoserver-2.15-SNAPSHOT-netcdf-ghrsst-plugin.zip \
	geoserver-2.15-SNAPSHOT-notification-plugin.zip \
	geoserver-2.15-SNAPSHOT-nsg-wfs-profile-plugin.zip \
	geoserver-2.15-SNAPSHOT-nsg-wmts-profile-plugin.zip \
	geoserver-2.15-SNAPSHOT-onelogin-plugin.zip \
	geoserver-2.15-SNAPSHOT-opensearch-eo-plugin.zip \
	geoserver-2.15-SNAPSHOT-ows-simulate-plugin.zip \
	geoserver-2.15-SNAPSHOT-params-extractor-plugin.zip \
	geoserver-2.15-SNAPSHOT-pgraster-plugin.zip \
	geoserver-2.15-SNAPSHOT-python-plugin.zip \
	geoserver-2.15-SNAPSHOT-qos-plugin.zip \
	geoserver-2.15-SNAPSHOT-s3-geotiff-plugin.zip \
	geoserver-2.15-SNAPSHOT-sec-keycloak-plugin.zip \
	geoserver-2.15-SNAPSHOT-sec-oauth2-geonode-plugin.zip \
	geoserver-2.15-SNAPSHOT-sec-oauth2-github-plugin.zip \
	geoserver-2.15-SNAPSHOT-sec-oauth2-google-plugin.zip \
	geoserver-2.15-SNAPSHOT-sec-oauth2-openid-connect-plugin.zip \
	geoserver-2.15-SNAPSHOT-solr-plugin.zip \
	geoserver-2.15-SNAPSHOT-status-monitoring-plugin.zip \
	geoserver-2.15-SNAPSHOT-taskmanager-core-plugin.zip \
	geoserver-2.15-SNAPSHOT-taskmanager-s3-plugin.zip \
	geoserver-2.15-SNAPSHOT-web-resource-browser-plugin.zip \
	geoserver-2.15-SNAPSHOT-wfs3-plugin.zip \
	geoserver-2.15-SNAPSHOT-wms-eo-plugin.zip \
	geoserver-2.15-SNAPSHOT-wmts-multi-dimensional-plugin.zip \
	geoserver-2.15-SNAPSHOT-wps-download-plugin.zip \
	geoserver-2.15-SNAPSHOT-wps-jdbc-plugin.zip \
	geoserver-2.15-SNAPSHOT-wps-remote-plugin.zip)

for i in "${comm_array[@]}"
do
    if [ ! -f ${EXT_OUTPUT_DIR}/${i} ]; then
        url="https://build.geoserver.org/geoserver/${GS_VERSION:0:4}.x/community-latest/${i}"
        if curl --output /dev/null --silent --head --fail "${url}"; then
            echo "${fg_green}URL exists: ${fg_yellow}${url}"
            wget -q --no-check-certificate -c ${url} -O ${COMM_OUTPUT_DIR}/${i}
        else
            echo "${fg_red}URL does not exist: ${fg_yellow}${url}${reset}"
        fi;
    else
        echo "${fg_cyan}${bold_start}|${bg_yellow}${fg_white} File '${fg_magenta}${i}${fg_white}' already exists, moving on...${bold_end}${reset}"
    fi;
done

echo "${bg_yellow}${fg_blue}All GeoServer Community Plugins downloaded...${reset}"
