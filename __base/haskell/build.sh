#!/bin/sh

RESOLVER="${1}"

if [ -z "${RESOLVER}" ]; then
    echo "Please specify the resolver." 1>&2
    exit 1
fi

docker build --build-arg "RESOLVER=${RESOLVER}" -t "stack:${RESOLVER}" .
