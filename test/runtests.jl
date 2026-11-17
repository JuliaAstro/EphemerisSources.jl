using Test, EphemerisSources

@testset "EphemerisSources" begin
    for pkg in (:HorizonsAPI, :HorizonsEphemeris, :SPICEKernels, :SPICEBodies)
        @test isdefined(EphemerisSources, pkg)
    end
end
