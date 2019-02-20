#!/bin/bash

cd $(dirname $0)

while read line
do
    RESOLVER=$(echo ${line} | tr -s ' ' | cut -d' ' -f1)
    GHC_VERSION=$(echo ${line} | tr -s ' ' | cut -d' ' -f2)
    TAG="stack:${RESOLVER}"

    if [ $(docker images | grep "${TAG}" | wc -l) -eq 0 ]; then
        docker build --build-arg "RESOLVER=${RESOLVER}" "GHC_VERSION=${GHC_VERSION}" -t "${TAG}" .
    fi
done < <(cat resolver-list.txt | grep -v -e "^[[:space:]]*#" -e "^[[:space:]]*$")
