using Test, Dates, HorizonsEphemeris, AstroTime, DataFrames, CSV
using HorizonsEphemeris:
    parse_response,
    csv_header,
    column_names,
    parse_table,
    fetch_table,
    timespec,
    tabletype,
    write_table,
    VECTOR_LABELS,
    ELEMENT_LABELS,
    MAX_TLIST_LENGTH

const FIXTURES = joinpath(@__DIR__, "fixtures")
fixture(name) = read(joinpath(FIXTURES, name), String)

#
# Offline tests: recorded Horizons responses, no network access required.
#

@testset "Offline: parse_response" begin
    parsed = parse_response(fixture("mars-elements-range.json"))
    @test startswith(parsed.header, "JDTDB,")
    @test count('\n', parsed.ephemeris) == 2   # three rows
    @test !isempty(parsed.notes)

    ephemeris, notes = parse_response(fixture("mars-elements-range.json"))
    @test ephemeris == parsed.ephemeris
    @test notes == parsed.notes

    @test startswith(
        parse_response(fixture("mars-observer-topocentric.json")).header,
        "Date_________JDUT,",
    )
    @test startswith(parse_response(fixture("mars-vectors-tlist.json")).header, "JDTDB,")
    @test_throws ErrorException parse_response(fixture("error-no-delimiters.json"))
end

@testset "Offline: csv_header" begin
    @test csv_header("preamble\n*****\n A, B, C,\n*****\n") == "A, B, C,"
    @test csv_header("preamble\n*****\n A, B, C,\n*****\n\n\n") == "A, B, C,"
    @test isnothing(csv_header("preamble\n*****\nno commas here\n*****\n"))
    @test isnothing(csv_header(""))
end

@testset "Offline: column_names" begin
    header = "Date_________JDUT, , , R.A._(ICRF), DEC_(ICRF),    APmag,  S-brt,             delta,     deldot,     S-O-T,/r,     S-T-O,"
    @test column_names(header, 12) == [
        :t,
        :solar_presence,
        :lunar_presence,
        :ra,
        :dec,
        :apmag,
        :sbrt,
        :delta,
        :deldot,
        :sot,
        :sot_flag,
        :sto,
    ]
    @test column_names(header, 11) == [Symbol("column_$i") for i = 1:11]
    @test column_names(nothing, 3) == [:column_1, :column_2, :column_3]

    elements = parse_response(fixture("mars-elements-range.json")).header
    @test length(column_names(elements, 14)) == 14
    @test column_names(elements, 14)[1:2] == [:t, :cal]

    vectors = parse_response(fixture("mars-vectors-tlist.json")).header
    @test column_names(vectors, 8) == [:t, :cal, :x, :y, :z, :vx, :vy, :vz]

    @test column_names(
        "Date__(UT)__HR:MN, , , R.A._(ICRF), DEC__(ICRF), R.A._(a-app), DEC_(a-app),",
        7,
    ) == [:cal, :solar_presence, :lunar_presence, :ra, :dec, :ra_app, :dec_app]
    @test column_names("A, B, A, 1-way_down_LT, X-Y%,", 5) == [:a, :b, :a_2, :lighttime, :x_y]
end

@testset "Offline: parse_table" begin
    parsed = parse_response(fixture("mars-elements-range.json"))
    table = parse_table(parsed.ephemeris, parsed.header; header = ELEMENT_LABELS)
    @test keys(table) == Tuple(ELEMENT_LABELS)
    @test length(table.t) == 3
    @test table.t[1] == 2460310.5
    @test table.cal[1] == "A.D. 2024-Jan-01 00:00:00.0000"
    @test table.e[1] ≈ 9.329516809023837e-2
    @test table.a[1] ≈ 2.279388565540124e8
    @test DataFrame(table) isa DataFrame

    parsed = parse_response(fixture("mars-observer-topocentric.json"))
    table = parse_table(parsed.ephemeris, parsed.header)
    @test keys(table) == (
        :t,
        :solar_presence,
        :lunar_presence,
        :ra,
        :dec,
        :apmag,
        :sbrt,
        :delta,
        :deldot,
        :sot,
        :sot_flag,
        :sto,
    )
    @test table.solar_presence[1] == "*"
    @test ismissing(table.solar_presence[2])
    @test table.lunar_presence[3] == "m"
    @test table.sot_flag == ["/L", "/L", "/L"]
    @test table.ra[1] ≈ 266.69490

    parsed = parse_response(fixture("voyager1-observer-na.json"))
    table = parse_table(parsed.ephemeris, parsed.header)
    @test eltype(table.apmag) <: Union{Missing,Float64}
    @test all(ismissing, table.apmag)
    @test all(ismissing, table.sbrt)
    @test table.delta[1] ≈ 2.4363366391e10

    parsed = parse_response(fixture("mars-observer-default-format.json"))
    table = parse_table(parsed.ephemeris, parsed.header)
    @test keys(table) == (:cal, :solar_presence, :lunar_presence, :ra, :dec, :delta, :deldot)
    @test table.ra == ["17 46 46.93"]

    parsed = parse_response(fixture("mars-vectors-tlist.json"))
    table = parse_table(parsed.ephemeris, parsed.header; header = VECTOR_LABELS)
    @test keys(table) == Tuple(VECTOR_LABELS)
    @test eltype(table.x) == Float64
    @test table.x[1] ≈ -3.013262392582653e-1

    @test_throws ErrorException parse_table(parsed.ephemeris, parsed.header; header = [:a, :b])
    renamed = parse_table(parsed.ephemeris, parsed.header; header = ["a", "b", "c", "d", "e", "f", "g", "h"])
    @test keys(renamed) == (:a, :b, :c, :d, :e, :f, :g, :h)
end

@testset "Offline: chunked requests" begin
    log = []
    fake(code; kwargs...) = (push!(log, (; kwargs...)); fixture("mars-vectors-tlist.json"))

    times = collect(2460310.5:1:2460380.5)   # 71 Julian days, three chunks
    table = fetch_table(fake, 499, timespec(times; mjd = false); header = VECTOR_LABELS)
    @test length(log) == 3
    @test all(length(entry.TLIST) <= MAX_TLIST_LENGTH for entry in log)
    @test sum(length(entry.TLIST) for entry in log) == length(times)
    @test all(all(>(2.4e6), entry.TLIST) for entry in log)   # still Julian days
    @test all(entry.TLIST_TYPE == "JD" for entry in log)
    @test all(entry.format == "json" && entry.CSV_FORMAT == true for entry in log)
    @test length(table.t) == 3 * 2
    @test eltype(table.x) == Float64

    calls = Ref(0)
    alternating(code; kwargs...) = (
        calls[] += 1;
        fixture(isodd(calls[]) ? "voyager1-observer-na.json" : "mars-observer-topocentric.json")
    )
    table = fetch_table(alternating, 499, timespec(collect(1.0:61.0)))
    @test length(table.t) == 2 + 3 + 2
    @test eltype(table.apmag) == Union{Missing,Float64}
    @test count(ismissing, table.apmag) == 4

    calls[] = 0
    mismatched(code; kwargs...) = (
        calls[] += 1;
        fixture(isodd(calls[]) ? "mars-vectors-tlist.json" : "mars-observer-topocentric.json")
    )
    @test_throws ErrorException fetch_table(mismatched, 499, timespec(collect(1.0:61.0)))
end

@testset "Offline: timespec" begin
    spec = timespec("2024-01-01", "2024-01-02", Day(1))
    @test spec.START_TIME == "2024-01-01 00:00:00.000"
    @test spec.STOP_TIME == "2024-01-02 00:00:00.000"
    @test spec.STEP_SIZE == "1 day"
    @test timespec("2024-01-01", "2024-01-02", "1 month").STEP_SIZE == "1 month"
    @test timespec("2024-01-01", "2024-01-02", 5days).STEP_SIZE == "5 days"
    @test_throws ErrorException timespec("2024-01-01", "2024-01-02", 1.5days)

    @test timespec(59000.0) == (; TLIST = [59000.0], TLIST_TYPE = "MJD")
    @test timespec(59000.0; mjd = false) == (; TLIST = [59000.0 + 2400000.5], TLIST_TYPE = "JD")
    @test timespec(2460310.5; mjd = false) == (; TLIST = [2460310.5], TLIST_TYPE = "JD")
    @test timespec((59000.0, 59001.0)).TLIST == [59000.0, 59001.0]
    @test timespec(["2024-01-01"]).TLIST ≈ [60310.0]
end

@testset "Offline: keyword validation" begin
    @test tabletype(:Vectors) == Val(:vectors)
    @test tabletype("OBSERVER") == Val(:observer)
    @test tabletype(:elements) == Val(:elements)
    @test_throws ArgumentError tabletype(:spk)

    @test_throws ArgumentError HorizonsEphemeris.table(Val(:vectors), 499, timespec(0.0); quantities = "1")
    @test_throws ArgumentError HorizonsEphemeris.table(Val(:elements), 499, timespec(0.0); quantities = [1, 2])
    @test_throws ArgumentError HorizonsEphemeris.table(Val(:observer), 499, timespec(0.0); plane = "FRAME")
    @test_throws ErrorException HorizonsEphemeris.check_units("parsecs")

    @test HorizonsEphemeris.quantity_string([1, 9, 20]) == "1,9,20"
    @test HorizonsEphemeris.quantity_string(" 1,9 ") == "1,9"
    @test HorizonsEphemeris.quantity_string(4) == "4"
end

@testset "Offline: write_table" begin
    parsed = parse_response(fixture("mars-observer-default-format.json"))
    table = parse_table(parsed.ephemeris, parsed.header)
    file = tempname()
    write_table(file, table, 499)
    written = CSV.File(file)
    @test length(written) == 1
    @test written.names == collect(keys(table))
    @test String(written.ra[1]) == "17 46 46.93"
end

#
# Live tests: these query the Horizons API.
#

@testset "Simple Request" begin
    @test ephemeris("moon", "2022-01-01", "2023-01-01", "1 month") isa NamedTuple
end

@testset "Large Request" begin
    mars = ephemeris("mars", now() - Year(100), now() + Year(100), Month(1))
    @test mars isa NamedTuple

    @test length(mars.t) > MAX_TLIST_LENGTH

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

@testset "Orbital Elements" begin
    mars = ephemeris("mars", "2024-01-01", "2024-01-31", "1 day"; type = :elements)
    @test keys(mars) == Tuple(ELEMENT_LABELS)
    @test length(mars.t) == 31
    @test all(0 .< mars.e .< 1)
    @test mars.a[1] ≈ 2.279e8 rtol = 1e-2   # kilometers
    @test DataFrame(mars) isa DataFrame

    times = collect(59000.0:5:59300.0)   # 61 modified Julian days, more than one chunk
    mars = ephemeris("mars", times; type = :elements)
    @test length(mars.t) == length(times)
    @test mars.a[1] ≈ 1.5237 rtol = 1e-2   # astronomical units

    single = ephemeris("mars", now(); type = "elements")
    @test length(single.t) == 1
end

@testset "Observer Tables" begin
    mars = ephemeris("mars", now(); type = :observer)   # discrete times default to AU-D
    @test all(label in keys(mars) for label in (:t, :ra, :dec, :delta))
    @test 0 <= mars.ra[1] < 360
    @test -90 <= mars.dec[1] <= 90
    @test 0.3 < mars.delta[1] < 3   # astronomical units

    km = ephemeris("mars", now(); type = :observer, units = "KM-S")
    @test km.delta[1] > 4e7   # kilometers

    moon = ephemeris("moon", now(); type = :observer, site = "568", quantities = [1, 20])
    @test keys(moon) == (:t, :solar_presence, :lunar_presence, :ra, :dec, :delta, :deldot)

    voyager = ephemeris(-31, now(); type = :observer)
    @test any(ismissing, voyager.apmag)

    range = ephemeris("mars", now(), now() + Day(3), Day(1); type = :observer)
    @test length(range.t) == 4
end

@testset "Julian Day Inputs with Chunking" begin
    times = collect(2460000.5:1:2460035.5)   # 36 Julian days, more than one chunk
    earth = ephemeris("earth", times; mjd = false)
    @test length(earth.t) == length(times)
    @test earth.t ≈ times atol = 1e-3
end

@testset "Write to File" begin
    for type in (:vectors, :observer, :elements)
        file = tempname()
        ephemeris("jupiter", now(); type = type, file = file)
        @test isfile(file)
    end
end
