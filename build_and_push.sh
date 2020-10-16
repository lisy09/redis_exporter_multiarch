#!/bin/bash

set -x

if [[ -z "${TARGET_TAG}" ]]; then
    TARGET_TAG=v1.12.1
fi
if [[ -z "${TARGET_REPO}" ]]; then
    TARGET_REPO=lisy09/redis_exporter
fi
ORIGIN_IMAGE=oliver006/redis_exporter

TARGET_REPO=$TARGET_REPO \
    TARGET_TAG=$TARGET_TAG \
    ORIGIN_IMAGE=$ORIGIN_IMAGE \
    docker buildx bake -f docker-bake.hcl \
    --push

docker manifest create -a ${TARGET_REPO}:${TARGET_TAG} \
    ${TARGET_REPO}:${TARGET_TAG}-amd64 \
    ${TARGET_REPO}:${TARGET_TAG}-arm64 \
    ${TARGET_REPO}:${TARGET_TAG}-arm
docker manifest push ${TARGET_REPO}:${TARGET_TAG}