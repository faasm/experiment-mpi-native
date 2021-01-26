#!/bin/bash

set -e

THIS_DIR=$(dirname $(readlink -f $0))
DOCKER_DIR=${THIS_DIR}/..
PROJ_ROOT=${THIS_DIR}/../..

IMAGE_NAME="experiment-lammps-mpi-native"

pushd ${PROJ_ROOT} >> /dev/null

source ${PROJ_ROOT}/.env

export DOCKER_BUILDKIT=1

# Docker args
NO_CACHE=$1

docker build \
    ${NO_CACHE} \
    -t faasm/${IMAGE_NAME}:${FAABRIC_VERSION} \
    -f ${DOCKER_DIR}/${IMAGE_NAME}.dockerfile \
    --build-arg EXPERIMENTS_VERSION=${EXPERIMENTS_VERSION} \
    --build-arg FAABRIC_VERSION=${FAABRIC_VERSION} \
    ${PROJ_ROOT}

popd >> /dev/null

