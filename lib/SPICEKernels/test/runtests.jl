# PkgEval's sandbox image (Debian bookworm) has an outdated CA bundle that doesn't trust
# JPL's certificate chain (Sectigo Public Server Authentication Root R46). Use Julia's
# bundled CA roots there instead; certificates are still verified.
if get(ENV, "PKGEVAL", "false") == "true"
    using NetworkOptions
    ENV["JULIA_SSL_CA_ROOTS_PATH"] = NetworkOptions.bundled_ca_roots()
end

using Test, Scratch
using SPICEKernels

Scratch.clear_scratchspaces!(SPICEKernels)

KERNEL = let
    iskernel(x) = getproperty(SPICEKernels, x) isa SPICEKernels.SPICEKernel && isconcretetype(typeof(getproperty(SPICEKernels, x)))
    all = map(name -> getproperty(SPICEKernels, name), filter(iskernel, propertynames(SPICEKernels)))
    rand(all)
end

@info "Testing $KERNEL"

@testset "Kernel Downloading" begin
    @test KERNEL(ignorecache=true) isa String
end

@testset "Kernel Caching" begin
    @test KERNEL(ignorecache=false) isa String
end

@testset "Kernel Copying" begin
    tmp = mktempdir()
    path = KERNEL(ignorecache=false, directory=tmp)
    @test isfile(path)
    Base.rm(path)
end
