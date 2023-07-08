#!/bin/bash

set -exu

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
IMAGE_NAME="roygbiv-load-tester:v0-0-1"
docker build -t "$IMAGE_NAME" .

for CSV_FILE in "$CONNECTION_FILES_PATH"/*.csv; do
    echo "CSV_FILE: $CSV_FILE"
    if [ -f "$CSV_FILE" ]; then
        FILE_NAME=$(basename "$CSV_FILE")

        if ! docker ps | grep -q roygbiv-load-tester; then
            docker run --name roygbiv-load-tester --rm -v  "$CONNECTION_FILES_PATH":/connection_files "$IMAGE_NAME" /connection_files/"$FILE_NAME"
        fi

        docker system prune -f

        docker exec -it roygbiv-load-tester connection loadtest /connection_files/"$FILE_NAME"
    fi
done
