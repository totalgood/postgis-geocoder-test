#! /bin/bash

source env-dockerservice

echo "Testing the geocoder - compare lon and lat with Google Maps"
psql -d geocoder -f test-geocoder.sql
