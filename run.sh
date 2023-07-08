#!/bin/bash

set -ex

docker pull node:latest

IMAGE_NAME="roygbiv-load-tester:v0-0-1"
docker build -t "$IMAGE_NAME" .

CONNECTION_FILES_PATH="/home/farscapian/sovereign-stack/deployment/project/clams-server/output"

docker run -it -v "$CONNECTION_FILES_PATH":/connection_files "$IMAGE_NAME" /connection_files/cln_connection_info-roygbiv.team.csv
