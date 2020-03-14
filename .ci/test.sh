#!/usr/bin/env bash

set -ex

# Start the mock server
docker-compose up -d mockserver

# Run a command that captures a screenshot and creates a config file
docker-compose run snapcrawl --config config example.com

# Verify screenshot and config were created
test -f snaps/http-example-com.png
test -f config.yml

# Do another one
docker-compose run snapcrawl mockserver:3000
test -f snaps/http-mockserver-3000.png
