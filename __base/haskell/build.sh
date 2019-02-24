#!/bin/bash

cd $(dirname $0)

while read RESOLVER
do
    TAG="stack:${RESOLVER}"
    if [ $(docker images | grep "${TAG}" | wc -l) -eq 0 ]; then
        docker build . -t "${TAG}" \
               --build-arg "RESOLVER=${RESOLVER}"
    fi
done < <(cat resolver-list.txt | grep -v -e "^[[:space:]]*#" -e "^[[:space:]]*$")
