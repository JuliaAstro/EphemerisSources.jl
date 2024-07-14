using Test, SPICEBodies

using SPICE: furnsh
using SPICEKernels
using AstroTime

furnsh(de440(), latest_leapseconds_lsk(), gm_de440(), pck00011())

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

@testset "Callables" begin
    earth = KernelBody("earth")

    @test earth(now()) isa NamedTuple
    @test earth(now(); dimension = Val(:all)) isa NamedTuple
    @test earth(now(); dimension = Val(:position)) isa NamedTuple
    @test earth(now(); dimension = Val(:velocity)) isa NamedTuple
end