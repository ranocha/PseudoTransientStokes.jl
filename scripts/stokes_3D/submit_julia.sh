#!/bin/bash

# -> to make it executable: chmod +x runme.sh or chmod 755 runme.sh

project_dir=/scratch/lraess/PTsolvers/PseudoTransientStokes
app_dir=scripts/stokes_3D

export HOME2=${project_dir}
export JULIA_PROJECT=${HOME2}/${app_dir}
export JULIA_DEPOT_PATH=${HOME2}/julia_depot
export JULIA_CUDA_USE_BINARYBUILDER=false
export JULIA_MPI_BINARY=system

export IGG_CUDAAWARE_MPI=1
export JULIA_NUM_THREADS=4

module purge > /dev/null 2>&1

module load julia
module load cuda/11.0 
module load openmpi/gcc83-306-c110 

julia_=$(which julia)

# $julia_ -O3 --check-bounds=no Stokes3D_multixpu.jl

# USE_GPU=true NX=255 NY=255 NZ=255 DO_VIZ=true $julia_ -O3 --check-bounds=no Stokes3D_multixpu.jl

RES=$1
U_GPU=$2
D_VIZ=$3
D_SAVE=$4

# USE_GPU=$U_GPU DO_VIZ=$D_VIZ DO_SAVE=$D_SAVE NX=$RES NY=$RES NZ=$RES $julia_ -O3 --check-bounds=no Stokes3D_multixpu.jl
# USE_GPU=$U_GPU DO_VIZ=$D_VIZ DO_SAVE=$D_SAVE NX=$RES NY=$RES NZ=$RES $julia_ -O3 --check-bounds=no Stokes3D_ve_multixpu.jl
USE_GPU=$U_GPU DO_VIZ=$D_VIZ DO_SAVE=$D_SAVE NX=$RES NY=$RES NZ=$RES $julia_ -O3 --check-bounds=no Stokes3D_ve2_multixpu.jl
