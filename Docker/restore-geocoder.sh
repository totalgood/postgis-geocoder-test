pg_restore -d postgres -v -C -e -U postgres /gisdata/geocoder.pgdump
chown -R hackob:hackob ~hackob
