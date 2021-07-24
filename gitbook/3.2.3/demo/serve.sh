#!/usr/bin/env bash

docker run -v $PWD:/srv/gitbook fellah/gitbook gitbook init
docker run -v $PWD:/srv/gitbook fellah/gitbook gitbook install
docker run -p 4000:4000 -v $PWD:/srv/gitbook fellah/gitbook gitbook serve