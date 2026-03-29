#!/bin/sh

## check and download with adoptium api
## https://github.com/adoptium/api.adoptium.net/blob/main/docs/cookbook.adoc#example-two-linking-to-the-latest-jdk-or-jre
## https://github.com/adoptium/api.adoptium.net/blob/main/docs/cookbook.adoc#example-three-scripting-a-download-using-the-adoptium-api

set -e

echo " "
echo " "
echo 'build opencode-jdk start'

echo " "
echo " "

docker buildx bake \
    -f ${PROJECT_DIR}/opencode-jdk/opencode-jdk.hcl \
    --pull \
    --push \
    --no-cache

echo 'build opencode-jdk finished'
echo " "
echo " "