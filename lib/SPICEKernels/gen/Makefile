SHELL := /bin/bash
JULIA_NUM_THREADS := $(shell nproc --all)

all:
	which jc || pipx install jc
	curl -H 'Cache-Control: no-cache' https://naif.jpl.nasa.gov/pub/ls-lR.gz --output ls-lR.gz
	gunzip ls-lR.gz --force --uncompress
	cat ls-lR | jc --ls -lR | tee ls-lR.json > /dev/null
	JULIA_DEBUG=Main,SPICEKernels julia --threads ${JULIA_NUM_THREADS} --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.develop(PackageSpec(path="..")); include("make.jl")' force

.PHONY: all
