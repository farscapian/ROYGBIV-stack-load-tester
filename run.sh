#!/bin/bash

set -eu
cd "$(dirname "$0")"


CONNECTION_FILES_PATH=

# grab any modifications from the command line.
for i in "$@"; do
    case $i in
        --connection-csv-path=*)
            CONNECTION_FILES_PATH="${i#*=}"
            shift
        ;;
        *)
        echo "Unexpected option: $1"
        exit 1
        ;;
    esac
done

if [ -z "$CONNECTION_FILES_PATH" ]; then
    echo "ERROR: you MUST specify the input path: --connection-csv-path="
    exit 1
fi

docker pull node:latest
IMAGE_NAME="roygbiv/load-tester:v0-0-1"
docker build -t "$IMAGE_NAME" .


docker system prune -f

if [ -f "$CONNECTION_FILES_PATH" ]; then
    FILE_NAME=$(basename "$CONNECTION_FILES_PATH")
    PATH_NAME=$(dirname "$CONNECTION_FILES_PATH")

    docker run --name roygbiv-load-tester --rm -v "$PATH_NAME":/connection_files "$IMAGE_NAME" "/connection_files/$FILE_NAME"

fi