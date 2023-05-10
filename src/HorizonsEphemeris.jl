"""
Interact with the JPL HORIZONS REST API.

# Extended Help

$(README)

## License

$(LICENSE)

## Exports

$(EXPORTS)

## Imports

$(IMPORTS)
"""
module HorizonsEphemeris

export NAIF, ephemeris

using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)
                                         $(DOCSTRING)
                                         """

@template (TYPES, CONSTANTS) = """
                               $(TYPEDEF)
                               $(DOCSTRING)
                               """

import JSON
import HTTP

using CSV
using Dates
using SPICE: bodc2n, bodn2c
using HorizonsAPI: fetch_vectors

"""
The Horizons API can only process so many discrete time points at once!

# Extended Help

See [#2](https://github.com/cadojo/HorizonsEphemeris.jl/issues/2).
"""
const MAX_TLIST_LENGTH = 30

"""
Given a NAIF ID, return the associated name, if one exists. If the ID provided cannot be
found, a `KeyError` is thrown.
"""
function NAIF(name::AbstractString)::Int

    code = bodn2c(name)

    if !isnothing(code)
        return code
    else
        throw(KeyError(name))
    end

end

"""
If a name is given, return the associated NAIF ID, if one exists. If the name provided
cannot be found, a `KeyError` is thrown.
"""
function NAIF(code::Integer)::String

    name = bodc2n(code)

    if !isnothing(name)
        return name
    else
        throw(KeyError(code))
    end

end

"""
Parse the body of a `HTTP.Response` for CSV content, and any returned notes about the CSV content.
"""
function parse_response(response::HTTP.Response; start="\$\$SOE", stop="\$\$EOE")

    content = JSON.parse(String(response.body))

    result = content["result"]

    if occursin(start, result) && occursin(stop, result)
        _, ephemeris = split(result, start)
        ephemeris, notes = split(ephemeris, stop)

        ephemeris = strip(ephemeris)

        notes = join(
            filter(
                line -> !all(char -> char == '*', collect(strip(line))),
                collect(eachline(IOBuffer(notes))),
            ), "\n"
        ) |> strip

        return ephemeris, notes
    else
        if "error" in keys(content)
            error("The data delimiters ($start, $stop) were not found in the response! \n\n\t$(content["error"])")
        else
            error("The data delimiters ($start, $stop) were not found in the response!")
        end
    end

end

"""
Given any timestamp, return the corresponding modified Julian date.
"""
MJD(timestamp) = datetime2julian(DateTime(timestamp)) - 2400000.5
MJD(timestamp::AbstractFloat) = timestamp - 2400000.5 < zero(timestamp) ? timestamp : timestamp - 2400000.5
MJD(timestamp::Tuple) = MJD([timestamp...])
MJD(timestamp::AbstractVector) = map(MJD, timestamp)

"""
Pull ephemeris data for the provided celestial body, or celestial system.
"""
function ephemeris(
    body, start, stop, intervol;
    site="",
    wrt="ssb",
    file=nothing,
    units="AU-D",
    header=[:t, :cal, :x, :y, :z, :ẋ, :ẏ, :ż]
)
    code = body isa Integer ? body : NAIF(body)

    if !(uppercase(strip(units)) in ("AU-D", "KM-D", "KM-S"))
        error("The only acceptable inputs for the units keyword argument are: KM-S, KM-D, AU-D.")
    end

    response = fetch_vectors(
        code;
        format="json",
        CENTER="$(site)@$(NAIF(wrt))",
        START_TIME=Dates.format(DateTime(start), "yyyy-mm-dd HH:MM:SS.sss"),
        STOP_TIME=Dates.format(DateTime(stop), "yyyy-mm-dd HH:MM:SS.sss"),
        STEP_SIZE=string(intervol),
        REF_PLANE="FRAME",
        CSV_FORMAT=true,
        VEC_TABLE=2,
        VEC_CORR="NONE",
        OUT_UNITS=units,
        VEC_LABELS=false,
        VEC_DELTA_T=false,
        TIME_DIGITS="FRACSEC"
    )

    ephemeris, notes = parse_response(response; start="\$\$SOE", stop="\$\$EOE")

    csv = CSV.File(IOBuffer(ephemeris); header=false, drop=[9])
    output = NamedTuple(label => csv[column] for (label, column) in zip(header, csv.names))

    if !isnothing(file)
        CSV.write(file, csv; header=header)
        @info "Ephemeris data for object with NAIF ID $code has been written to $file."
    end

    return output
end

function ephemeris(
    body, times::Base.AbstractVecOrTuple;
    site="",
    wrt="ssb",
    mjd=true,
    file=nothing,
    units="AU-D",
    header=[:t, :cal, :x, :y, :z, :ẋ, :ẏ, :ż]
)

    code = body isa Integer ? body : NAIF(body)

    if !(uppercase(strip(units)) in ("AU-D", "KM-D", "KM-S"))
        error("The only acceptable inputs for the units keyword argument are: KM-S, KM-D, AU-D.")
    end

    mjdtimes = MJD(times)

    request(ts) = begin
        response = fetch_vectors(
            code;
            format="json",
            CENTER="$(site)@$(NAIF(wrt))",
            REF_PLANE="FRAME",
            CSV_FORMAT=true,
            VEC_TABLE=2,
            VEC_CORR="NONE",
            OUT_UNITS=units,
            VEC_LABELS=false,
            VEC_DELTA_T=false,
            TIME_DIGITS="FRACSEC",
            TLIST=[mjd ? ts : ts .+ 2400000.5],
            TLIST_TYPE=(mjd ? "MJD" : "JD")
        )

        ephemeris, notes = parse_response(response; start="\$\$SOE", stop="\$\$EOE")

        csv = CSV.File(IOBuffer(ephemeris); header=false, drop=[9])

        NamedTuple(label => csv[column] for (label, column) in zip(header, csv.names))
    end

    combine(x, y) = begin
        for column in header
            append!(
                getproperty(x, column),
                getproperty(y, column),
            )
        end

        x
    end

    if length(mjdtimes) > MAX_TLIST_LENGTH

        output = mapreduce(request, combine, Iterators.partition(times, MAX_TLIST_LENGTH))

    else

        response = fetch_vectors(
            code;
            format="json",
            CENTER="$(site)@$(NAIF(wrt))",
            REF_PLANE="FRAME",
            CSV_FORMAT=true,
            VEC_TABLE=2,
            VEC_CORR="NONE",
            OUT_UNITS=units,
            VEC_LABELS=false,
            VEC_DELTA_T=false,
            TIME_DIGITS="FRACSEC",
            TLIST=[mjd ? mjdtimes : mjdtimes .+ 2400000.5],
            TLIST_TYPE=(mjd ? "MJD" : "JD")
        )

        ephemeris, notes = parse_response(response; start="\$\$SOE", stop="\$\$EOE")

        csv = CSV.File(IOBuffer(ephemeris); header=false, drop=[9])
        output = NamedTuple(label => csv[column] for (label, column) in zip(header, csv.names))

    end

    if !isnothing(file)
        CSV.write(file, csv; header=header)
        @info "Ephemeris data for object with NAIF ID $code has been written to $file."
    end

    return output

end

function ephemeris(
    body, time;
    site="",
    wrt="ssb",
    mjd=true,
    file=nothing,
    units="AU-D",
    header=[:t, :cal, :x, :y, :z, :ẋ, :ẏ, :ż]
)

    code = body isa Integer ? body : NAIF(body)

    if !(uppercase(strip(units)) in ("AU-D", "KM-D", "KM-S"))
        error("The only acceptable inputs for the units keyword argument are: KM-S, KM-D, AU-D.")
    end

    mjdtime = MJD(time)

    response = fetch_vectors(
        code;
        format="json",
        CENTER="$(site)@$(NAIF(wrt))",
        REF_PLANE="FRAME",
        CSV_FORMAT=true,
        VEC_TABLE=2,
        VEC_CORR="NONE",
        OUT_UNITS=units,
        VEC_LABELS=false,
        VEC_DELTA_T=false,
        TIME_DIGITS="FRACSEC",
        TLIST=[mjd ? mjdtime : mjdtime + 2400000.5],
        TLIST_TYPE=(mjd ? "MJD" : "JD")
    )

    ephemeris, notes = parse_response(response; start="\$\$SOE", stop="\$\$EOE")

    csv = CSV.File(IOBuffer(ephemeris); header=false, drop=[9])
    output = NamedTuple(label => csv[column] for (label, column) in zip(header, csv.names))

    if !isnothing(file)
        CSV.write(file, csv; header=header)
        @info "Ephemeris data for object with NAIF ID $code has been written to $file."
    end

    return output

end

end # module HorizonsEphemeris
