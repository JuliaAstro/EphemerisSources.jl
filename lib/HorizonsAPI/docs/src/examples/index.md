# Examples

The HORIZONS REST API accepts specific key-words for each type of command. Some
keywords are common to all commands, but most keywords are only valid for some
subset of available HORIZONS REST API commands. Thanks to Julia's
metaprogramming, and [helpful community](https://discourse.julialang.org/t/unpack-namedtuple-into-a-function-definition/97500/2),
these keyword arguments are specified precisely in the signature of each
`fetch_*` function. This allows users to simply press `TAB` in their chosen
tab-completion-supporting IDE, and view all options that are available for each
individual command.

```julia
julia> fetch_vectors(399; # <TAB>

fetch_vectors(COMMAND; file, AIRMASS, ANG_FORMAT, ANG_RATE_CUTOFF, APPARENT, CAL_FORMAT, CAL_TYPE, CENTER, COORD_TYPE, CSV_FORMAT, ELEV_CUT, ELM_LABELS, EMAIL_ADDR, EXTRA_PREC, LHA_CUTOFF, OUT_UNITS, QUANTITIES, RANGE_UNITS, REF_PLANE, REF_SYSTEM, R_T_S_ONLY, SITE_COORD, SKIP_DAYLT, SOLAR_ELONG, START_TIME, STEP_SIZE, STOP_TIME, SUPPRESS_RANGE_RATE, TIME_DIGITS, TIME_ZONE, TLIST, TLIST_TYPE, TP_TYPE, VEC_CORR, VEC_DELTA_T, VEC_LABELS, VEC_TABLE, format) @ HorizonsAPI ~/Projects/Astrodynamics/HorizonsAPI.jl/src/HorizonsAPI.jl:317
```

Take a look at each of the following examples for ideas about how to use the
HORIZONS REST API from within Julia.

### Cartesian States

```@repl
using HorizonsAPI

fetch_vectors(
    399; # NAIF ID for Earth's center of mass
    START_TIME = "2024-01-01",
    STOP_TIME = "2025-01-01",
    STEP_SIZE = "1d", # one day
    CENTER = "@ssb", # solar system barycenter
    format = "text", # the "text" format is most useful; a minimal "json" format is also available
    file = "earth.txt", # save the HTTP response contents to a local file
)
```

### Orbital Elements

```@repl
using HorizonsAPI

fetch_elements(
    "APOPHIS";
    EPOCH = "J2000",
    format = "text",
    file = "apophis.txt", # save the HTTP response contents to a local file
)
```

### Idiomatic Julia

You'll notice that `HorizonsAPI` only offers a Julia interface to the JPL HORIZONS
REST API; without other packages, you'll need to parse the resulting ephemeris data
on your own. Thankfully, `HorizonsEphemeris` provides ephemeris fetching methods
which are fully abstracted from the REST API. For more information, see the
`HorizonsEphemeris` documentation!

```@repl
using Dates, HorizonsEphemeris

earth = let start = now() - Year(50), stop = now() + Year(50), step = Day(1)
    @time ephemeris("earth", start, stop, step; wrt="jupiter", units="AU-D");
end
```
