#! /bin/bash

pushd ~hackob
git clone https://github.com/hackoregon/transportation-backend.git
cd transportation-backend
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
popd
