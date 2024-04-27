using Test, SPICEBodies

using SPICE: furnsh
using SPICEKernels

furnsh(
    de440(), latest_leapseconds_lsk(), gm_de440(), pck00011(), 
)

@testset "Constructors" begin
    @test KernelBody("earth") isa KernelBody
    @test KernelBody(399) isa KernelBody
end

@testset "Parameters" begin
    earth = KernelBody("earth")

    @test SPICEBodies.naifcode(earth) == 399
    @test gm("earth") ≈ 398600.435
    @test radii(earth) ≈ [6378.1366, 6378.1366, 6356.7519]
end