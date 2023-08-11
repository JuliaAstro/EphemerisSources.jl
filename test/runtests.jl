using Test, Dates, HorizonsEphemeris

@testset "Simple Request" begin
    @test ephemeris("moon", "2022-01-01", "2023-01-01", "1 month") isa NamedTuple
end


@testset "Large Request" begin
    mars = ephemeris("mars", now() - Year(100), now() + Year(100), Month(1))
    @test mars isa NamedTuple

    @test length(mars.t) > HorizonsEphemeris.MAX_TLIST_LENGTH

    @test ephemeris("earth", mars.t) isa NamedTuple
end

@testset "Write to File" begin
    file = tempname()
    ephemeris("jupiter", now(); file=file)
    @test isfile(file)
end
