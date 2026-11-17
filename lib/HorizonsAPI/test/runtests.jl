using Test, HorizonsAPI

@testset "URL Encoding" begin
    # Horizons does not accept exponent notation, which Julia uses for large floats such as
    # Julian days. Every other value keeps the existing formatting.
    @test HorizonsAPI.urlify(2460000.5) == "'2460000.5'"
    @test HorizonsAPI.urlify(60000.0) == "'60000'"
    @test HorizonsAPI.urlify(0.003) == "'0.003'"
    @test HorizonsAPI.urlify([2460000.5, 2460001.5]) == "'2460000.5' '2460001.5'"
    @test HorizonsAPI.urlify(499) == "'499'"
    @test HorizonsAPI.urlify(true) == "YES"
    @test HorizonsAPI.urlify("@10") == "'@10'"
    @test HorizonsAPI.urlify("text") == "text"
    @test HorizonsAPI.urlify((0, 0, 0)) == "'0,0,0'"
    @test ismissing(HorizonsAPI.urlify(missing))
end

@testset "API Version" begin

    response = HorizonsAPI.request(-1; format="text", MAKE_EPHEM=false, OBJ_DATA=false)

    normalize_newlines(s) = replace(s, r"\r\n" => "\n")
    response = String(response.body)
    response = join(split(response, "\n")[1:2], "\n") |> strip |> normalize_newlines
    regression = read("regression/api-version.txt", String) |> strip |> normalize_newlines

    @test strip(response) == strip(regression)

end

@testset "Object Data" begin

    response = fetch_properties(499; format="text")

    normalize_newlines(s) = replace(s, r"\r\n" => "\n")
    response = String(response.body)
    response = join(split(response, "\n")[3:end], "\n") |> normalize_newlines

    regression = read("regression/mars-properties.txt", String) |> normalize_newlines

    @test strip(response) == strip(regression)

end

@testset "Vectors" begin

    response = fetch_vectors(
        599;
        START_TIME="2030-01-01",
        STOP_TIME="2030-01-02",
        STEP_SIZE="1 day",
        format="text"
    )

    normalize_newlines(s) = replace(s, r"\r\n" => "\n")
    response = String(response.body)
    _, response = split(response, "\$\$SOE"; limit=2)
    response, _ = split(response, "\$\$EOE"; limit=2)

    regression = read("regression/jupiter-vectors.txt", String)

    @test normalize_newlines(strip(response)) == normalize_newlines(strip(regression))

end

@testset "Discrete" begin

    times = [2.4333895068359375e6, 2.4516520068359375e6, 2.4607832568359375e6, 2.4425207568359375e6]
    response = fetch_vectors(
        399; TLIST=times, format="text", CSV_FORMAT=true
    )

    @test response.status == 200

end

@testset "Elements" begin
    # `fetch_elements` must accept the same time-range keyword arguments as the other
    # ephemeris requests, in addition to the user-defined orbit parameters.
    keywords = Base.kwarg_decl(only(methods(fetch_elements)))
    @test :START_TIME in keywords
    @test :STOP_TIME in keywords
    @test :STEP_SIZE in keywords
    @test :TLIST in keywords
    @test :CENTER in keywords
    @test :CSV_FORMAT in keywords
    @test :EPOCH in keywords

    response = fetch_elements(
        499;
        CENTER = "@10",
        START_TIME = "2024-01-01",
        STOP_TIME = "2024-01-02",
        STEP_SIZE = "1 day",
        CSV_FORMAT = true,
        format = "text",
    )
    @test response.status == 200

    body = String(response.body)
    @test occursin("\$\$SOE", body)
    @test occursin("EC,", body)
end
