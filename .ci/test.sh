#!/usr/bin/env bash

set -ex

docker-compose up -d mockserver
docker-compose run snapcrawl example.com
test -f snaps/http-example-com.png
test -f snapcrawl.pstore

docker-compose run snapcrawl mockserver:3000
test -f snaps/http-mockserver-3000.png
