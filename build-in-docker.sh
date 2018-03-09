#!/bin/bash

set -e

cd $(dirname $(readlink -f $0))

docker run -v /run/docker.sock:/var/run/docker.sock -v $PWD:/build anapsix/alpine-java:8_jdk_unlimited bash -c "test -S /run/docker.sock && test -d /build && apk update && apk add docker wget && cd /build && ./sbt docker:publishLocal"
