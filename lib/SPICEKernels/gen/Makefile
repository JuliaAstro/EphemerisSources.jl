all:
	JULIA_DEBUG=Main,SPICEKernels julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.develop(PackageSpec(path="..")); include("make.jl")' force