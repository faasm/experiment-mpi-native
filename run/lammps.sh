#!/bin/bash

set -e

THIS_DIR=$(dirname $(readlink -f $0))
PROJ_ROOT=${THIS_DIR}/..
LAMMPS_DIR=${THIS_DIR}/lammps
LAMMPS_BUILD_DIR=${LAMMPS_DIR}/build

export LD_LIBRARY_PATH=/build/faabric/install/lib

${LAMMPS_BUILD_DIR}/lmp $1 $2
