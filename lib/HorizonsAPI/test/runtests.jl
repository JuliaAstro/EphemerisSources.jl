# PkgEval's sandbox image (Debian bookworm) has an outdated CA bundle that doesn't trust
# JPL's certificate chain (Sectigo Public Server Authentication Root R46). Use Julia's
# bundled CA roots there instead; certificates are still verified.
if get(ENV, "PKGEVAL", "false") == "true"
    using NetworkOptions
    ENV["JULIA_SSL_CA_ROOTS_PATH"] = NetworkOptions.bundled_ca_roots()
end

using Test, HorizonsAPI

"""
Normalize Horizons text for regression comparisons: unify line endings and
drop trailing whitespace on each line, which Horizons does not keep stable.
"""
normalize(s) = join((rstrip(line) for line in split(replace(s, "\r\n" => "\n"), '\n')), '\n') |> strip

@testset "API Version" begin

    response = HorizonsAPI.request(-1; format="text", MAKE_EPHEM=false, OBJ_DATA=false)

    response = String(response.body)
    response = join(split(response, "\n")[1:2], "\n")
    regression = read("regression/api-version.txt", String)

    @test normalize(response) == normalize(regression)

end

@testset "Object Data" begin

    response = fetch_properties(499; format="text")

    response = String(response.body)
    response = join(split(response, "\n")[3:end], "\n")
    regression = read("regression/mars-properties.txt", String)

    @test normalize(response) == normalize(regression)

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

    @test normalize(response) == normalize(regression)

end

@testset "Discrete" begin

    times = [2.4333895068359375e6, 2.4516520068359375e6, 2.4607832568359375e6, 2.4425207568359375e6]
    response = fetch_vectors(
        399; TLIST=times, format="text", CSV_FORMAT=true
    )

    @test response.status == 200

end
