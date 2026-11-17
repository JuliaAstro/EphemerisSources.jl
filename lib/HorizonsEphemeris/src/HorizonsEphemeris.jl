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
using AstroTime
using SPICE: bodc2n, bodn2c
using HorizonsAPI: fetch_vectors, fetch_observer, fetch_elements

"""
The Horizons API can only process so many discrete time points at once!

# Extended Help

See [#2](https://github.com/JuliaAstro/HorizonsEphemeris.jl/issues/2).
"""
const MAX_TLIST_LENGTH = 30

"""
The ephemeris table types which [`ephemeris`](@ref) can fetch and parse.
"""
const TABLE_TYPES = (:vectors, :observer, :elements)

"""
Default column labels for Cartesian state vector tables (`type = :vectors`): the Julian day
(TDB), the calendar date, position, and velocity.
"""
const VECTOR_LABELS = [:t, :cal, :x, :y, :z, :ẋ, :ẏ, :ż]

"""
Default column labels for osculating orbital element tables (`type = :elements`), in the order
Horizons returns them: Julian day (TDB), calendar date, eccentricity `e`, periapsis distance `q`,
inclination `i`, longitude of the ascending node `Ω`, argument of periapsis `ω`, time of periapsis
`tp` (Julian day), mean motion `n`, mean anomaly `M`, true anomaly `ν`, semi-major axis `a`,
apoapsis distance `Q`, and sidereal orbital period `P`.
"""
const ELEMENT_LABELS = [:t, :cal, :e, :q, :i, :Ω, :ω, :tp, :n, :M, :ν, :a, :Q, :P]

"""
Default Horizons quantity codes for observer tables (`type = :observer`): astrometric right
ascension and declination (1), apparent visual magnitude and surface brightness (9), observer
range and range-rate (20), Sun-observer-target angle (23), and Sun-target-observer angle (24).
"""
const DEFAULT_QUANTITIES = "1,9,20,23,24"

"""
The `OUT_UNITS` values accepted by Horizons.
"""
const UNITS = ("AU-D", "KM-D", "KM-S")

"""
Given a NAIF ID, return the associated name, if one exists. If the ID provided cannot be
found, a `KeyError` is thrown.
"""
function NAIF(name::Union{Symbol,<:AbstractString})::Int

    code = bodn2c(string(name))

    if !isnothing(code)
        return code
    else
        throw(KeyError(string(name)))
    end

end

"""
Given a name, return the associated NAIF ID. If this fails, return the name.
"""
function trynaif(name::Union{Symbol,<:AbstractString})

    try
        return NAIF(name)
    catch e
        if e isa KeyError
            return string(name)
        else
            throw(e)
        end
    end

end

trynaif(code::Integer) = code

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

#
# Response parsing
#

"""
Return `true` if `line` is one of the horizontal rules Horizons prints (a line made only of
asterisks), or if it is blank.
"""
isrule(line::AbstractString) = all(==('*'), strip(line))

"""
Return the CSV header line which Horizons prints between two horizontal rules just before the
`\$\$SOE` marker, or `nothing` if no such line is found.
"""
function csv_header(preamble::AbstractString)

    for line in reverse(collect(eachline(IOBuffer(preamble))))
        isrule(line) && continue
        stripped = strip(line)
        return occursin(',', stripped) ? String(stripped) : nothing
    end

    return nothing

end

"""
Parse the body of a Horizons response for CSV content, the CSV header line, and any returned
notes about the CSV content. Returns a `NamedTuple` with fields `ephemeris`, `notes`, and
`header`; the first two can also be destructured positionally, i.e.
`ephemeris, notes = parse_response(response)`.
"""
function parse_response(body::AbstractString; start = "\$\$SOE", stop = "\$\$EOE")

    content = JSON.parse(body)

    result = content["result"]

    if occursin(start, result) && occursin(stop, result)
        preamble, rest = split(result, start; limit = 2)
        ephemeris, notes = split(rest, stop; limit = 2)

        notes = join(filter(!isrule, collect(eachline(IOBuffer(notes)))), "\n") |> strip

        return (; ephemeris = strip(ephemeris), notes = notes, header = csv_header(preamble))
    else
        if "error" in keys(content)
            error(
                "The data delimiters ($start, $stop) were not found in the response! \n\n\t$(content["error"])",
            )
        else
            error("The data delimiters ($start, $stop) were not found in the response!")
        end
    end

end

parse_response(response::HTTP.Response; kwargs...) =
    parse_response(String(response.body); kwargs...)

"""
Short lowercase names for Horizons observer-table column labels. Labels which are not listed
here (and which are not handled specially by [`column_names`](@ref)) are converted with
[`sanitize`](@ref).
"""
const LABEL_ALIASES = Dict{String,Symbol}(
    "APmag" => :apmag,
    "S-brt" => :sbrt,
    "Illu%" => :illum,
    "Def_illu" => :def_illum,
    "r" => :r,
    "rdot" => :rdot,
    "delta" => :delta,
    "deldot" => :deldot,
    "1-way_down_LT" => :lighttime,
    "S-O-T" => :sot,
    "S-T-O" => :sto,
    "T-O-M" => :tom,
    "O-P-T" => :opt,
    "MN_Illu%" => :moon_illum,
    "Cnst" => :constellation,
    "dRA*cosD" => :ra_rate,
    "d(DEC)/dt" => :dec_rate,
    "dAZ*cosE" => :az_rate,
    "d(ELV)/dt" => :el_rate,
    "Sky_motion" => :sky_motion,
    "Sky_mot_PA" => :sky_motion_pa,
    "RelVel-ANG" => :relvel_angle,
    "Ang-diam" => :ang_diam,
    "a-mass" => :airmass,
    "mag_ex" => :mag_ex,
    "L_Ap_Sid_Time" => :lst,
    "L_Ap_Hour_Ang" => :hour_angle,
    "L_Ap_SOL_Time" => :solar_time,
    "TDB-UT" => :tdb_ut,
    "UT1-UTC" => :ut1_utc,
    "hEcl-Lon" => :hecl_lon,
    "hEcl-Lat" => :hecl_lat,
    "ObsEcLon" => :obs_ecl_lon,
    "ObsEcLat" => :obs_ecl_lat,
    "GlxLon" => :glx_lon,
    "GlxLat" => :glx_lat,
    "Tru_Anom" => :true_anomaly,
    "PAB-LON" => :pab_lon,
    "PAB-LAT" => :pab_lat,
    "App_Lon_Sun" => :app_lon_sun,
    "N.Pole-RA" => :pole_ra,
    "N.Pole-DC" => :pole_dec,
    "ObsSub-LON" => :obs_sub_lon,
    "ObsSub-LAT" => :obs_sub_lat,
    "SunSub-LON" => :sun_sub_lon,
    "SunSub-LAT" => :sun_sub_lat,
)

"""
Convert an arbitrary Horizons column label into a valid, lowercase `Symbol`.
"""
function sanitize(label::AbstractString)

    name = lowercase(strip(replace(label, r"[^A-Za-z0-9]+" => "_"), '_'))

    if isempty(name)
        name = "column"
    elseif isdigit(first(name))
        name = "_" * name
    end

    return Symbol(name)

end

"""
Make every name in `names` unique by appending `_2`, `_3`, ... to repeated names.
"""
function deduplicate(names::AbstractVector{Symbol})

    seen = Dict{Symbol,Int}()
    unique = Symbol[]

    for name in names
        count = get(seen, name, 0) + 1
        seen[name] = count
        push!(unique, count == 1 ? name : Symbol(name, "_", count))
    end

    return unique

end

"""
Derive column labels from the CSV header line Horizons returns. Blank labels (the solar and
lunar presence flags of observer tables) become `:solar_presence` and `:lunar_presence`, date
columns become `:t` (Julian day) or `:cal` (calendar string), common observer quantities get
short lowercase names, relational columns like `/r` are attached to the column to their left
(`:sot_flag`), and anything else is converted with [`sanitize`](@ref). If no header line is
available, or if the number of derived labels does not match `ncolumns`, generic labels
`:column_1`, `:column_2`, ... are returned instead.
"""
function column_names(headerline::AbstractString, ncolumns::Integer)

    labels = strip.(split(headerline, ','))

    if !isempty(labels) && isempty(last(labels))
        pop!(labels)
    end

    names = Symbol[]
    blanks = 0

    for label in labels
        name = if isempty(label)
            blanks += 1
            blanks == 1 ? :solar_presence :
            blanks == 2 ? :lunar_presence : Symbol("column_", length(names) + 1)
        elseif startswith(label, "JD") || (startswith(label, "Date") && occursin("JD", label))
            :t
        elseif startswith(label, "Date") || startswith(label, "Calendar")
            :cal
        elseif startswith(label, "R.A.")
            occursin("app", label) ? :ra_app : :ra
        elseif startswith(label, "DEC")
            occursin("app", label) ? :dec_app : :dec
        elseif startswith(label, "Azi")
            :az
        elseif startswith(label, "Elev")
            :el
        elseif haskey(LABEL_ALIASES, label)
            LABEL_ALIASES[label]
        elseif startswith(label, '/')
            Symbol(isempty(names) ? :column : last(names), "_flag")
        else
            sanitize(label)
        end

        push!(names, name)
    end

    if length(names) != ncolumns
        return column_names(nothing, ncolumns)
    end

    return deduplicate(names)

end

column_names(::Nothing, ncolumns::Integer) = [Symbol("column_", i) for i = 1:ncolumns]

"""
Prepare the CSV text Horizons returns for parsing: `n.a.` values and whitespace-only fields
(such as the blank presence flags of observer tables) become empty fields, which parse as
`missing`, and the whitespace surrounding every field is removed while whitespace inside
values, such as calendar dates, is preserved.
"""
function normalize_csv(text::AbstractString)

    lines = String[]

    for line in eachline(IOBuffer(text))
        line = replace(strip(line), "n.a." => "")
        isempty(line) && continue
        push!(lines, replace(line, r"\s*,\s*" => ","))
    end

    return join(lines, "\n") * "\n"

end

"""
Parse the CSV text between the `\$\$SOE` and `\$\$EOE` markers into a `NamedTuple` of column
vectors. The trailing empty column Horizons produces (every row ends with a comma) is dropped,
and `n.a.` values become `missing`. Column labels are taken from `header` if provided, and are
otherwise derived from `headerline` with [`column_names`](@ref).
"""
function parse_table(text::AbstractString, headerline; header = nothing)

    csv = CSV.File(IOBuffer(normalize_csv(text)); header = false, stringtype = String, pool = false)

    columns = collect(csv.names)

    if !isempty(columns) && all(ismissing, csv[last(columns)])
        pop!(columns)
    end

    labels = isnothing(header) ? column_names(headerline, length(columns)) : Symbol.(collect(header))

    if length(labels) != length(columns)
        error(
            "Expected $(length(labels)) columns, but Horizons returned $(length(columns)). " *
            "The column labels derived from the response are $(column_names(headerline, length(columns))).",
        )
    end

    return NamedTuple(label => csv[column] for (label, column) in zip(labels, columns))

end

#
# Requests
#

"""
Format any timestamp the way Horizons expects for `START_TIME` and `STOP_TIME`.
"""
timestamp(time) = Dates.format(DateTime(time), "yyyy-mm-dd HH:MM:SS.sss")

"""
Convert a step size into the `STEP_SIZE` string Horizons expects, e.g. `"1 day"`.
"""
function step_string(intervol)

    if intervol isa AstroTime.Periods.AstroPeriod
        val = AstroTime.Periods.value(intervol)

        try
            val = Int(val)
        catch e
            if e isa InexactError
                error(
                    "The intervol you provided, $intervol, has a value which is not a whole number. Please specify a whole number of minutes or days.",
                )
            else
                throw(e)
            end
        end

        unit = ""
        try
            unit = join(split(string(intervol))[begin+1:end], " ")
        catch e
            if e isa BoundsError
                error(
                    "failed to parse intervol '$intervol'; please file an issue: https://GitHub.com/JuliaAstro/EphemerisSources.jl/issues/new.",
                )
            else
                throw(e)
            end
        end

        return "$val $unit"
    end

    return string(intervol)

end

"""
Given any timestamp, return the corresponding modified Julian date.
"""
MJD(timestamp) = datetime2julian(DateTime(timestamp)) - 2400000.5
MJD(timestamp::AstroTime.AstroDates.DateTime) = AstroTime.julian(timestamp)
MJD(timestamp::AbstractFloat) =
    timestamp - 2400000.5 < zero(timestamp) ? timestamp : timestamp - 2400000.5
MJD(timestamp::Tuple) = MJD(collect(timestamp))
MJD(timestamp::AbstractVector) = map(MJD, timestamp)

"""
Return the Horizons time-specification keyword arguments for a start time, stop time, and step.
"""
function timespec(start, stop, intervol)
    return (;
        START_TIME = timestamp(start),
        STOP_TIME = timestamp(stop),
        STEP_SIZE = step_string(intervol),
    )
end

"""
Return the Horizons time-specification keyword arguments for a collection of discrete times,
sent as modified Julian days (`mjd = true`) or Julian days (`mjd = false`).
"""
function timespec(times::Base.AbstractVecOrTuple; mjd = true)
    mjdtimes = MJD(times)
    return (;
        TLIST = mjd ? mjdtimes : mjdtimes .+ 2400000.5,
        TLIST_TYPE = mjd ? "MJD" : "JD",
    )
end

timespec(time; mjd = true) = timespec((time,); mjd)

"""
Vertically concatenate two tables with identical column labels.
"""
function vcat_tables(x::NamedTuple, y::NamedTuple)

    if keys(x) != keys(y)
        error(
            "Horizons returned different column sets across chunked requests: $(keys(x)) and $(keys(y)).",
        )
    end

    return map(vcat, x, y)

end

"""
Send one or more requests with `fetch` (one of the `HorizonsAPI.fetch_*` functions) for the
body with NAIF ID `code` and the time specification `spec`, and parse the responses into a
single table. Requests for more than `MAX_TLIST_LENGTH` discrete times are split into chunks.
All other keyword arguments are forwarded to `fetch`; `format` and `CSV_FORMAT` are always
overridden, because the parser depends on them.
"""
function fetch_table(fetch, code, spec::NamedTuple; header = nothing, options...)

    request(times) = begin
        response = fetch(code; options..., times..., format = "json", CSV_FORMAT = true)
        parsed = parse_response(response)
        parse_table(parsed.ephemeris, parsed.header; header = header)
    end

    if haskey(spec, :TLIST) && length(spec.TLIST) > MAX_TLIST_LENGTH
        chunks = (
            merge(spec, (; TLIST = collect(chunk))) for
            chunk in Iterators.partition(spec.TLIST, MAX_TLIST_LENGTH)
        )

        return reduce(vcat_tables, (request(chunk) for chunk in chunks))
    else
        return request(spec)
    end

end

"""
Write a table to `file` as CSV.
"""
function write_table(file, output::NamedTuple, code)
    CSV.write(file, output)
    @info "Ephemeris data for object with NAIF ID $code has been written to $file."
    return file
end

#
# Table types
#

"""
Validate an ephemeris table type and return it as a `Val` for dispatch.
"""
function tabletype(type)

    name = Symbol(lowercase(strip(string(type))))

    if !(name in TABLE_TYPES)
        throw(
            ArgumentError(
                "unknown ephemeris type $(repr(type)); expected one of $(join(repr.(TABLE_TYPES), ", ")).",
            ),
        )
    end

    return Val(name)

end

"""
Return the NAIF ID for `body`, or `body` itself if no NAIF ID is known.
"""
bodycode(body) = body isa Integer ? body : trynaif(body)

"""
Return the Horizons `CENTER` string for a site on (or the center of) the body `wrt`.
"""
center(site, wrt) = "$(site)@$(trynaif(wrt))"

"""
Validate the `units` keyword argument and return it in the form Horizons expects.
"""
function check_units(units)

    normalized = uppercase(strip(string(units)))

    if !(normalized in UNITS)
        error(
            "The only acceptable inputs for the units keyword argument are: KM-S, KM-D, AU-D.",
        )
    end

    return normalized

end

"""
Convert the `quantities` keyword argument into the Horizons `QUANTITIES` string.
"""
quantity_string(quantities::AbstractString) = string(strip(quantities))
quantity_string(quantities::Integer) = string(quantities)
quantity_string(quantities) = join(string.(quantities), ",")

"""
Throw an `ArgumentError` if a keyword argument was provided for a table type it does not apply to.
"""
function reject(keyword::Symbol, value, type::Symbol)
    if !isnothing(value)
        throw(
            ArgumentError(
                "the `$keyword` keyword argument does not apply to `type = $(repr(type))`.",
            ),
        )
    end
end

"""
Fetch and parse a Cartesian state vector table.
"""
function table(
    ::Val{:vectors},
    body,
    spec::NamedTuple;
    site = "",
    wrt = nothing,
    file = nothing,
    units = "KM-S",
    frame = "ICRF",
    plane = nothing,
    quantities = nothing,
    header = nothing,
    options...,
)

    reject(:quantities, quantities, :vectors)

    code = bodycode(body)

    # The discrete-time methods have always requested the FRAME reference plane, while the
    # start/stop/step method has always used the Horizons default (ECLIPTIC).
    if isnothing(plane) && haskey(spec, :TLIST)
        plane = "FRAME"
    end

    plane_option = isnothing(plane) ? (;) : (; REF_PLANE = string(plane))

    output = fetch_table(
        fetch_vectors,
        code,
        spec;
        header = something(header, VECTOR_LABELS),
        CENTER = center(site, something(wrt, "ssb")),
        REF_SYSTEM = string(frame),
        plane_option...,
        VEC_TABLE = 2,
        VEC_CORR = "NONE",
        OUT_UNITS = check_units(units),
        VEC_LABELS = false,
        VEC_DELTA_T = false,
        TIME_DIGITS = "FRACSEC",
        options...,
    )

    isnothing(file) || write_table(file, output, code)

    return output

end

"""
Fetch and parse an osculating orbital element table.
"""
function table(
    ::Val{:elements},
    body,
    spec::NamedTuple;
    site = "",
    wrt = nothing,
    file = nothing,
    units = "KM-S",
    frame = "ICRF",
    plane = nothing,
    quantities = nothing,
    header = nothing,
    options...,
)

    reject(:quantities, quantities, :elements)

    code = bodycode(body)

    output = fetch_table(
        fetch_elements,
        code,
        spec;
        header = something(header, ELEMENT_LABELS),
        CENTER = center(site, something(wrt, "sun")),
        REF_SYSTEM = string(frame),
        REF_PLANE = string(something(plane, "ECLIPTIC")),
        OUT_UNITS = check_units(units),
        TIME_DIGITS = "FRACSEC",
        TP_TYPE = "ABSOLUTE",
        options...,
    )

    isnothing(file) || write_table(file, output, code)

    return output

end

"""
Fetch and parse an observer table.
"""
function table(
    ::Val{:observer},
    body,
    spec::NamedTuple;
    site = "",
    wrt = nothing,
    file = nothing,
    units = "KM-S",
    frame = "ICRF",
    plane = nothing,
    quantities = nothing,
    header = nothing,
    options...,
)

    reject(:plane, plane, :observer)

    code = bodycode(body)

    output = fetch_table(
        fetch_observer,
        code,
        spec;
        header = header,
        CENTER = center(site, something(wrt, "earth")),
        REF_SYSTEM = string(frame),
        QUANTITIES = quantity_string(something(quantities, DEFAULT_QUANTITIES)),
        ANG_FORMAT = "DEG",
        CAL_FORMAT = "JD",
        TIME_DIGITS = "FRACSEC",
        RANGE_UNITS = first(split(check_units(units), '-')),
        options...,
    )

    isnothing(file) || write_table(file, output, code)

    return output

end

#
# Public interface
#

"""
Pull ephemeris data for the provided celestial body, or celestial system, from JPL Horizons,
and return it as a `NamedTuple` of column vectors. The result is compatible with `Tables.jl`,
so e.g. `DataFrame(ephemeris(...))` works if `DataFrames.jl` is loaded.

Times can be provided as a start time, stop time, and step (`ephemeris(body, start, stop, step)`),
as a collection of discrete times (`ephemeris(body, times)`), or as a single time
(`ephemeris(body, time)`). Discrete times may be modified Julian days (the default), Julian days
(`mjd = false`), date strings, `DateTime`s, or `AstroTime` epochs. Horizons only accepts a
limited number of discrete times per request, so long collections are fetched in chunks.

# Keyword Arguments

- `type`: the Horizons table to fetch. One of `:vectors` (the default: Cartesian position and
  velocity), `:observer` (observer tables: sky positions, magnitudes, ranges, and other
  observables), or `:elements` (osculating orbital elements).
- `wrt`: the body the ephemeris is relative to. Defaults to the solar system barycenter for
  `:vectors`, the Sun for `:elements`, and the Earth for `:observer`.
- `site`: an observing site on `wrt`, used together with `wrt` to form the Horizons `CENTER`
  string `site@wrt`. Leave empty for the body center, or provide an observatory code such as
  `"568"` (Mauna Kea) or `"coord"` together with `SITE_COORD = (longitude, latitude, altitude)`.
- `units`: `"KM-S"`, `"KM-D"`, or `"AU-D"`. Defaults to `"KM-S"` when a start time, stop time,
  and step are provided, and to `"AU-D"` otherwise. Observer tables only use the distance unit.
- `frame`: the reference system, `"ICRF"` (the default) or `"B1950"`.
- `plane`: the reference plane for `:vectors` and `:elements`: `"ECLIPTIC"`, `"FRAME"`, or
  `"BODY EQUATOR"`. Elements default to `"ECLIPTIC"`. For vectors, the start/stop/step method
  uses the Horizons default (`"ECLIPTIC"`) and the discrete-time methods use `"FRAME"`.
- `quantities`: for `:observer` only, the Horizons quantity codes to include, either as a string
  like `"1,9,20,23,24"` (the default) or as a collection of integers.
- `header`: column labels to use instead of the defaults described below.
- `file`: if provided, the table is also written to this path as a CSV file.
- `mjd`: for the discrete-time methods, whether times are sent to Horizons as modified Julian
  days (`true`, the default) or Julian days (`false`).

Any other keyword argument is forwarded to the underlying `HorizonsAPI` request, so every
Horizons parameter (e.g. `APPARENT`, `ELEV_CUT`, `SKIP_DAYLT`, `SITE_COORD`) is available.

# Columns

- `:vectors`: `t` (Julian day, TDB), `cal` (calendar date), `x`, `y`, `z`, `ẋ`, `ẏ`, `ż`.
- `:elements`: `t` (Julian day, TDB), `cal`, `e`, `q`, `i`, `Ω`, `ω`, `tp`, `n`, `M`, `ν`, `a`,
  `Q`, `P`. Angles are in degrees; distances, times, and rates follow `units`.
- `:observer`: labels are derived from the response, so they depend on `quantities`. The default
  quantities give `t` (Julian day, UT), `solar_presence`, `lunar_presence`, `ra`, `dec`
  (degrees), `apmag`, `sbrt`, `delta`, `deldot`, `sot`, `sot_flag`, and `sto`. Values Horizons
  reports as `n.a.` are `missing`.

# Examples

```julia
ephemeris("earth", "2024-01-01", "2024-02-01", "1 day"; wrt = "sun")
ephemeris("mars", "2024-01-01", "2024-02-01", "1 day"; type = :elements)
ephemeris("mars", "2024-01-01", "2024-02-01", "1 day"; type = :observer, site = "568")
ephemeris("moon", now(); type = :observer, quantities = [1, 4, 20])
```
"""
function ephemeris(body, start, stop, intervol; type = :vectors, kwargs...)
    return table(tabletype(type), body, timespec(start, stop, intervol); kwargs...)
end

function ephemeris(
    body,
    times::Base.AbstractVecOrTuple;
    type = :vectors,
    mjd = true,
    units = "AU-D",
    kwargs...,
)
    return table(tabletype(type), body, timespec(times; mjd = mjd); units = units, kwargs...)
end

function ephemeris(body, time; type = :vectors, mjd = true, units = "AU-D", kwargs...)
    return table(tabletype(type), body, timespec(time; mjd = mjd); units = units, kwargs...)
end

end # module HorizonsEphemeris
