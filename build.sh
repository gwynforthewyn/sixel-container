#!/bin/sh -el

VERSION=0.0.1

DIR=$(dirname $0)
cd ${DIR}

docker build --tag debthon:${VERSION} .
