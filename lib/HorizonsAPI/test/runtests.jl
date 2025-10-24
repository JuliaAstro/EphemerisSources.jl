using Test, HorizonsAPI

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

    response = String(response.body)
    response = join(split(response, "\n")[3:end], "\n")

    regression = read("regression/mars-properties.txt", String)

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

    response = String(response.body)
    _, response = split(response, "\$\$SOE"; limit=2)
    response, _ = split(response, "\$\$EOE"; limit=2)

    regression = read("regression/jupiter-vectors.txt", String)

    @test strip(response) == strip(regression)

end

@testset "Discrete" begin

    times = [2.4333895068359375e6, 2.4516520068359375e6, 2.4607832568359375e6, 2.4425207568359375e6]
    response = fetch_vectors(
        399; TLIST=times, format="text", CSV_FORMAT=true
    )

    @test response.status == 200

end
