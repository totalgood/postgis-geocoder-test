FROM docker.io/postgres:9.6
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Install PostGIS and utilities
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
  ca-certificates \
  postgresql-9.6-postgis-2.3 \
  postgresql-9.6-postgis-2.3-scripts \
  wget \
  vim-nox \
  && apt-get clean

RUN apt-get install -qqy --no-install-recommends \
  python-pip \
  python3-pip \
  python-setuptools \
  python3-setuptools \
  && apt-get clean \
  && pip install --upgrade pip \
  && pip install virtualenvwrapper

# Grab geocoder dump file
RUN mkdir -p /gisdata
WORKDIR /gisdata
RUN wget -q https://github.com/hackoregon/postgis-geocoder-test/releases/download/testing/geocoder.pgdump

# set up entry point to restore the geocoder
RUN mkdir -p /docker-entrypoint-initdb.d
COPY restore-geocoder.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/restore-geocoder.sh

# GeoIP and gdal
RUN apt-get install -qqy --no-install-recommends \
  gdal-bin \
  geoip-bin \
  geoip-database-extra \
  && apt-get clean

# PgRouting
RUN apt-get install -qqy --no-install-recommends \
  git \
  postgresql-9.6-pgrouting \
  postgresql-9.6-pgrouting-scripts \
  && apt-get clean

# A non-root user!
RUN useradd -c "Hack Oregon Generic Backend User" -u 1000 -s /bin/bash -m hackob

# More dependencies
RUN apt-get install -qqy --no-install-recommends \
  libpq-dev \
  build-essential \
  python-dev \
  python3-dev \
  && apt-get clean
