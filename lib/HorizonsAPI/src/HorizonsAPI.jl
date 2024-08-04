"""
Interact with the JPL Horizons REST API.

# Extended Help

## License

$(LICENSE)

## Exports

$(EXPORTS)

## Imports

$(IMPORTS)
"""
module HorizonsAPI

export fetch_properties, fetch_observer, fetch_vectors, fetch_spk, fetch_elements, fetch_approach

import HTTP
using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)

                                         $(DOCSTRING)
                                         """

@template (TYPES, CONSTANTS) = """
                               $(TYPEDEF)

                               $(DOCSTRING)
                               """

"""
The Horizons API endpoint.
"""
const ENDPOINT = "https://ssd.jpl.nasa.gov/api/horizons.api"

"""
The Horizons API accepts very specific formatting for some strings. For example, setting
the `format` option to "text" is fine, but "'text'" will cause the server to throw an error.
Each method of `urlify` takes in a single argument, and outputs a string.

The one exception here is the method which takes an argument of type `Missing`; that method
simply returns the singleton value `missing` to the option to be filtered out before the
query is sent.
"""
urlify(x) = urlify(string(x))
urlify(x::AbstractString) = !all(isletter, x) ? "'$x'" : string(x)

urlify(x::Bool) = x ? "YES" : "NO"
urlify(x::Nothing) = "NONE"
urlify(x::Missing) = missing
urlify(x::Number) = "'$x'"
urlify(x::NTuple) = """'$(replace(string(x), " " => "", "(" => "", ")" => ""))'"""
urlify(x::AbstractVector) = join(urlify.(x), " ")

"""
Common parameters, as specified by the Horizons API documentation.
"""
const COMMON_PARAMETERS = (;
    format="text",
    OBJ_DATA=true,
    MAKE_EPHEM=true,
    EPHEM_TYPE="OBSERVER",
    EMAIL_ADDR=missing
)

"""
Ephemeris-specific parameters, as specified by the Horizons API documentation.
"""
const EPHEMERIS_PARAMETERS = (;
    CENTER="Geocentric",
    REF_PLANE="ECLIPTIC",
    COORD_TYPE="GEODETIC",
    SITE_COORD=(0, 0, 0),
    START_TIME=missing,
    STOP_TIME=missing,
    STEP_SIZE="60 min",
    TLIST=missing,
    TLIST_TYPE=missing,
    QUANTITIES="A",
    REF_SYSTEM="ICRF",
    OUT_UNITS="KM-S",
    VEC_TABLE=3,
    VEC_CORR="NONE",
    CAL_FORMAT="CAL",
    CAL_TYPE="MIXED",
    ANG_FORMAT="HMS",
    APPARENT="AIRLESS",
    TIME_DIGITS="MINUTES",
    TIME_ZONE="+00:00",
    RANGE_UNITS="AU",
    SUPPRESS_RANGE_RATE="NO",
    ELEV_CUT=-90,
    SKIP_DAYLT="NO",
    SOLAR_ELONG=(0, 180),
    AIRMASS=38.0,
    LHA_CUTOFF=0.0,
    ANG_RATE_CUTOFF=0.0,
    EXTRA_PREC="NO",
    CSV_FORMAT="NO",
    VEC_LABELS="YES",
    VEC_DELTA_T="NO",
    ELM_LABELS="YES",
    TP_TYPE="ABSOLUTE",
    R_T_S_ONLY="NO"
)

"""
Parameters specific to spacecraft ephemeris, as specified by the Horizons API documentation.
"""
const SPK_PARAMETERS = (;
    START_TIME=missing,
    STOP_TIME=missing
)

"""
Parameters specific to close-approach requests, as specified by the Horizons API documentation.
"""
const APPROACH_PARAMETERS = (;
    CA_TABLE_TYPE="STANDARD",
    TCA3SG_LIMIT=14400,
    CALIM_SB=0.05,
    CALIM_PL=(0.1, 0.1, 0.1, 0.1, 1.0, 1.0, 1.0, 1.0, 0.1, 0.003)
)

"""
Parameters specific to user-requested heliocentric osculating orbital elements, as specified
by the Horizons API documentation.
"""
const ELEMENTS_PARAMETERS = (;
    OBJECT=missing,
    EPOCH=missing,
    ECLIP=missing,
    EC=missing,
    QR=missing,
    TP=missing,
    OM=missing,
    W=missing,
    IN=missing,
    MA=missing,
    A=missing,
    N=missing
)

"""
Parameters specific to small-body ephemeris requests, as specified by the Horizons API
documentation.
"""
const SMALL_BODY_PARAMETERS = (;
    RAD=missing,
    H=missing,
    G=missing,
    M1=missing,
    M2=missing,
    K1=missing,
    PHCOF=missing,
    A1=missing,
    A2=missing,
    A3=missing,
    RO=missing,
    ALN=missing,
    NM=missing,
    NN=missing,
    NK=missing,
    DT=missing,
    AMRAT=missing,
    SRC=missing,
    EST=missing
)

"""
Given keyword arguments which map to Horizons API parameters, construct a `Vector{Pair}`
that is compatible with the `query` keyword argument of `HTTP.get`.
"""
function query(COMMAND; options...)

    options = map(pair -> pair.first => urlify(pair.second), collect(pairs(options)))
    filter!(pair -> !ismissing(pair.second), options)
    push!(options, :COMMAND => string(strip(string(COMMAND))))

    return options

end


"""
Return a sequence of `Expr` objects which represent a `NamedTuple` with a format that is
compatible with keyword arguments in function definitions.

# Extended Help

## References:

- https://discourse.julialang.org/t/unpack-namedtuple-into-a-function-definition/97500/2
"""
function to_kwargs(parameters...)

    if isempty(parameters)
        return Expr[]
    end

    dict = merge(
        map(collection -> Dict(pairs(collection)), parameters)...
    )

    kws = sort(collect(keys(dict)))
    return [
        Expr(:kw, k, dict[k])
        for k in kws
    ]

end

function to_kwvals(parameters...)

    if isempty(parameters)
        return Expr[]
    end

    dict = merge(
        map(collection -> Dict(pairs(collection)), parameters)...
    )


    kws = sort(collect(keys(dict)))
    return [
        Expr(:(=), k, k)
        for k in kws
    ]
end

@eval begin

    """
    Return the requested Horizons data in the form of an `HTTP.Response`.
    """
    function request(COMMAND; file=nothing, $(
        to_kwargs(
            COMMON_PARAMETERS, EPHEMERIS_PARAMETERS, SPK_PARAMETERS,
            APPROACH_PARAMETERS, ELEMENTS_PARAMETERS
        )...)
    )

        common = (; $(to_kwvals(COMMON_PARAMETERS)...))
        ephem = (; $(to_kwvals(EPHEMERIS_PARAMETERS)...))
        spk = (; $(to_kwvals(SPK_PARAMETERS)...))
        approach = (; $(to_kwvals(APPROACH_PARAMETERS)...))
        elements = (; $(to_kwvals(ELEMENTS_PARAMETERS)...))

        options = common

        if strip(uppercase(urlify(options.MAKE_EPHEM))) == "YES"

            options = merge(options, ephem)
            type = strip(uppercase(options.EPHEM_TYPE))

            if type == "SPK"
                options = merge(options, spk)
            elseif type == "APPROACH"
                options = merge(options, approach)
            elseif type == "ELEMENTS"
                options = merge(options, elements)
            end

        end

        response = HTTP.get(
            ENDPOINT;
            query=query(COMMAND; options...)
        )

        if !isnothing(file)
            write(file, String(response.body))
        end

        return response

    end

    """
    Fetch physical attribute data for the body specified by `COMMAND`.
    """
    function fetch_properties(
        COMMAND; file=nothing, $(
            to_kwargs(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :EPHEM_TYPE, :OBJ_DATA)}))...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :EPHEM_TYPE, :OBJ_DATA)}))...))
        return request(COMMAND; file=file, MAKE_EPHEM=false, OBJ_DATA=true, options...)
    end

    """
    Fetch planetary ephemeris for the body specified by `COMMAND`, in the
    `EPHEM_TYPE="OBSERVER"` format.
    """
    function fetch_observer(
        COMMAND; file=nothing, $(
            to_kwargs(
                Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}),
                EPHEMERIS_PARAMETERS
            )...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}), EPHEMERIS_PARAMETERS)...))
        return request(COMMAND; file=file, MAKE_EPHEM=true, OBJ_DATA=false, EPHEM_TYPE="OBSERVER", options...)
    end

    """
    Fetch planetary ephemeris for the body specified by `COMMAND`, in the
    `EPHEM_TYPE="VECTORS"` format.
    """
    function fetch_vectors(
        COMMAND; file=nothing, $(
            to_kwargs(
                Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}),
                EPHEMERIS_PARAMETERS
            )...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}), EPHEMERIS_PARAMETERS)...))
        return request(COMMAND; file=file, MAKE_EPHEM=true, OBJ_DATA=false, EPHEM_TYPE="VECTORS", options...)
    end

    """
    Fetch planetary ephemeris for the body specified by `COMMAND`, in the
    `EPHEM_TYPE="SPK"` format.
    """
    function fetch_spk(
        COMMAND; file=nothing, $(
            to_kwargs(
                Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}),
                SPK_PARAMETERS
            )...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}), SPK_PARAMETERS)...))
        return request(COMMAND; file=file, MAKE_EPHEM=true, OBJ_DATA=false, EPHEM_TYPE="SPK", options...)
    end

    """
    Fetch planetary ephemeris for the body specified by `COMMAND`, in the
    `EPHEM_TYPE="APPROACH"` format.
    """
    function fetch_approach(
        COMMAND; file=nothing, $(
            to_kwargs(
                Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}),
                APPROACH_PARAMETERS
            )...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}), APPROACH_PARAMETERS)...))
        return request(COMMAND; file=file, MAKE_EPHEM=true, OBJ_DATA=false, EPHEM_TYPE="APPROACH", options...)
    end

    """
    Fetch planetary ephemeris for the body specified by `COMMAND`, in the
    `EPHEM_TYPE="ELEMENTS"` format.
    """
    function fetch_elements(
        COMMAND; file=nothing, $(
            to_kwargs(
                Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}),
                ELEMENTS_PARAMETERS
            )...
        )
    )
        options = (; $(to_kwvals(Base.structdiff(COMMON_PARAMETERS, NamedTuple{(:MAKE_EPHEM, :OBJ_DATA, :EPHEM_TYPE)}), ELEMENTS_PARAMETERS)...))
        return request(COMMAND; file=file, MAKE_EPHEM=true, OBJ_DATA=false, EPHEM_TYPE="ELEMENTS", options...)
    end
end


end # module HorizonsAPI
