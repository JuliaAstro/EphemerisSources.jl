using Test, Dates, HorizonsEphemeris, AstroTime, DataFrames

@testset "Simple Request" begin
    @test ephemeris("moon", "2022-01-01", "2023-01-01", "1 month") isa NamedTuple
end


@testset "Large Request" begin
    mars = ephemeris("mars", now() - Year(100), now() + Year(100), Month(1))
    @test mars isa NamedTuple

    @test length(mars.t) > HorizonsEphemeris.MAX_TLIST_LENGTH

    @test ephemeris("earth", mars.t) isa NamedTuple
end

@testset "External Package Integration" begin
    # AstroTime (dependency)
    ep = TTEpoch(59235.0days, origin = :modified_julian)

    earth = let start = ep - 5years, stop = ep + 5years, step = 5days
        ephemeris("earth", start, stop, step; wrt = "jupiter", units = "AU-D")
    end

    @test earth isa NamedTuple

    # DataFrames (not a dependency)
    @test DataFrame(earth) isa DataFrame
end

@testset "Write to File" begin
    file = tempname()
    ephemeris("jupiter", now(); file = file)
    @test isfile(file)
end
