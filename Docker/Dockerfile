FROM docker.io/postgres:9.6
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Install PostGIS and packages required for Django / GeoDjango
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
  build-essential \
  ca-certificates \
  gdal-bin \
  geoip-bin \
  geoip-database-extra \
  git \
  libpq-dev \
  postgresql-9.6-pgrouting \
  postgresql-9.6-pgrouting-scripts \
  postgresql-9.6-postgis-2.3 \
  postgresql-9.6-postgis-2.3-scripts \
  vim-nox \
  wget \
  && apt-get clean

# Download geocoder dump file
RUN mkdir -p /gisdata \
  && cd /gisdata \
  && wget -q https://github.com/hackoregon/postgis-geocoder-test/releases/download/testing/geocoder.pgdump

# Set up entry point to restore the geocoder database
RUN mkdir -p /docker-entrypoint-initdb.d
COPY restore-geocoder.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/restore-geocoder.sh

# Create non-root user!
ENV HACKOB_HOME=/home/hackob \
  PROJECT_HOME=home/hackob/Projects \
  WORKON_HOME=/home/hackob/.virtualenvs \
  VIRTUALENVWRAPPER_SCRIPT=/usr/share/virtualenvwrappper/virtualenvwrapper.sh
RUN useradd -c "Hack Oregon Generic Backend User" -u 1000 -s /bin/bash -m hackob \
  && echo "source $VIRTUALENVWRAPPER_SCRIPT >> $HACKOB_HOME/.bashrc" \
  && mkdir -p $PROJECT_HOME \
  && chown -R hackob:hackob $HACKOB_HOME
