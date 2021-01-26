ARG EXPERIMENTS_VERSION
ARG FAABRIC_VERSION
#FROM faasm/experiment-base:${EXPERIMENTS_VERSION} as experiments
#
#WORKDIR /experiments
#RUN git clone https://github.com/faasm/experiment-lammps
#WORKDIR /experiments/experiment-lammps
#RUN git clone https://github.com/faasm/lammps

FROM faasm/faabric-mpi-native:${FAABRIC_VERSION} as mpi-native

# Prepare code
WORKDIR /code
RUN git clone https://github.com/faasm/experiment-mpi-native
WORKDIR /code/experiment-mpi-native
RUN git submodule update --init

# Compile LAMMPS
RUN ./build/lammps.sh
