chown -R hackob:hackob /home/hackob
pg_restore -d postgres -v -C -e -U postgres /gisdata/geocoder.pgdump
