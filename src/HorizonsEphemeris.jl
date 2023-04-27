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

using CSV
using Dates
using SPICE: bodc2n, bodn2c
using HorizonsAPI: fetch_vectors


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
Pull ephemeris data for the provided celestial body, or celestial system.
"""
function ephemeris(
    body, start, stop, intervol;
    site="",
    wrt="ssb",
    epoch="J2000",
    file=nothing,
    units="KM-S",
    headers=[:MJD, :Calendar, :X, :Y, :Z, :ΔX, :ΔY, :ΔZ]
)
    code = body isa Integer ? body : NAIF(body)

    if !(uppercase(strip(units)) in ("AU-D", "KM-D", "KM-S"))
        throw(ErrorException("The only acceptable inputs for the units keyword argument are: KM-S, KM-D, AU-D."))
    end
    response = fetch_vectors(
        code;
        format="text",
        CENTER="$(site)@$(NAIF(wrt))",
        START_TIME=Dates.format(DateTime(start), "yyyy-mm-dd HH:MM:SS.sss"),
        STOP_TIME=Dates.format(DateTime(stop), "yyyy-mm-dd HH:MM:SS.sss"),
        STEP_SIZE=string(intervol),
        REF_SYSTEM=epoch,
        REF_PLANE="FRAME",
        CSV_FORMAT=true,
        VEC_TABLE=2,
        VEC_CORR="NONE",
        OUT_UNITS=units,
        VEC_LABELS=false,
        VEC_DELTA_T=false,
        TIME_DIGITS="FRACSEC",
        TLIST_TYPE="MJD"
    )

    content = String(response.body)
    _, ephemeris = split(content, "\$\$SOE")
    ephemeris, notes = split(ephemeris, "\$\$EOE")

    ephemeris = strip(ephemeris)

    notes = strip(notes)

    csv = CSV.File(IOBuffer(ephemeris); header=false, drop=[9])
    output = NamedTuple(label => csv[column] for (label, column) in zip(headers, csv.names))

    if !isnothing(file)
        CSV.write(file, csv; headers=headers)
        @info "Ephemeris data for object with NAIF ID $code has been written to $file."
    end

    return output
end

end # module HorizonsEphemeris
