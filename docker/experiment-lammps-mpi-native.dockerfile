ARG EXPERIMENTS_VERSION
ARG FAABRIC_VERSION
#FROM faasm/experiment-base:${EXPERIMENTS_VERSION} as experiments
#
#WORKDIR /experiments
#RUN git clone https://github.com/faasm/experiment-lammps
#WORKDIR /experiments/experiment-lammps
#RUN git clone https://github.com/faasm/lammps

FROM faasm/faabric-mpi-native:${FAABRIC_VERSION} as mpi-native

WORKDIR /code
RUN git clone -b mpi-native https://github.com/faasm/lammps

WORKDIR /code/lammps/build
