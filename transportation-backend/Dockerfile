FROM docker.io/python:3.6
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# create non-root user!
RUN useradd -c "Hack Oregon" -u 1000 -s /bin/bash -m hacko

# install virtualenv
RUN pip install virtualenv

USER hacko
WORKDIR /home/hacko
RUN git clone https://github.com/hackoregon/transportation-backend.git
WORKDIR /home/hacko/transportation-backend
RUN virtualenv -p python3 venv \
  && . venv/bin/activate \
  && pip install -r requirements.txt
