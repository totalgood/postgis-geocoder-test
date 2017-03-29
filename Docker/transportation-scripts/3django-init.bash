#! /bin/bash

pushd ~hackob/transportation-backend
source venv/bin/activate
mv transDjango/transDjango/settings_local_example.py transDjango/transDjango/settings_local.py
cd transDjango
./manage.py migrate
./manage.py import_jsons
./manage.py ingest_jsons
./manage.py runserver 0.0.0.0:8000
popd
