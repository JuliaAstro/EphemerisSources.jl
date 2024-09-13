SHELL := /bin/bash
JULIA_NUM_THREADS = $(shell nproc --all)

all:
	JULIA_DEBUG=Main,SPICEKernels julia --project=. --threads ${JULIA_NUM_THREADS} -e 'using Pkg; Pkg.instantiate(); Pkg.develop(PackageSpec(path="..")); include("make.jl")' force

.PHONY: all