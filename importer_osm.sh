wget -O dane.osm http://www.overpass-api.de/api/xapi?map?bbox=18.194,49.82,18.634,50.11

/home/mechanik/dev/konwersje/osmosis-latest/bin/osmosis \
--read-xml file=dane.osm outPipe.0=1 \
--write-pbf file=/home/mechanik/dev/imposm3/extract.osm.pbf omitmetadata=true granularity=1000 inPipe.0=1
./imposm3 import -mapping mapping_topo_c.json -connection postgis://osm:osm@localhost:5432/osm -read extract.osm.pbf -write -overwritecache
rm dane.osm
rm extract.osm.pbf
date > metadata.txt
echo "Powiat Wodzisławski, 18.194,49.82,18.634,50.11" >> metadata.txt
