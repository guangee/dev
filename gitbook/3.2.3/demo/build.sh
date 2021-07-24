#!/usr/bin/env bash

cd  /srv/gitbook && gitbook install && gitbook build . public
chmod -R 777 /srv/gitbook/public
chmod -R 777 /srv/gitbook/node_modules
