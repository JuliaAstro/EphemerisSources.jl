var documenterSearchIndex = {"docs":
[{"location":"reference/#Documentation","page":"Reference","title":"Documentation","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"All docstrings!","category":"page"},{"location":"reference/","page":"Reference","title":"Reference","text":"Modules = [\n    HorizonsAPI,\n]\nOrder = [:module, :type, :function, :constant]","category":"page"},{"location":"reference/#HorizonsAPI.HorizonsAPI","page":"Reference","title":"HorizonsAPI.HorizonsAPI","text":"Interact with the JPL Horizons REST API.\n\nExtended Help\n\nLicense\n\nMIT License\n\nCopyright (c) 2023 Joe Carpinelli\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\nExports\n\nfetch_approach\nfetch_elements\nfetch_observer\nfetch_properties\nfetch_spk\nfetch_vectors\n\nImports\n\nBase\nCore\nDocStringExtensions\n\n\n\n\n\n","category":"module"},{"location":"reference/#HorizonsAPI.fetch_approach-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_approach","text":"fetch_approach(\n    COMMAND;\n    file,\n    CALIM_PL,\n    CALIM_SB,\n    CA_TABLE_TYPE,\n    EMAIL_ADDR,\n    TCA3SG_LIMIT,\n    format\n)\n\n\nFetch planetary ephemeris for the body specified by COMMAND, in the EPHEM_TYPE=\"APPROACH\" format.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.fetch_elements-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_elements","text":"fetch_elements(\n    COMMAND;\n    file,\n    A,\n    EC,\n    ECLIP,\n    EMAIL_ADDR,\n    EPOCH,\n    IN,\n    MA,\n    N,\n    OBJECT,\n    OM,\n    QR,\n    TP,\n    W,\n    format\n)\n\n\nFetch planetary ephemeris for the body specified by COMMAND, in the EPHEM_TYPE=\"ELEMENTS\" format.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.fetch_observer-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_observer","text":"fetch_observer(\n    COMMAND;\n    file,\n    AIRMASS,\n    ANG_FORMAT,\n    ANG_RATE_CUTOFF,\n    APPARENT,\n    CAL_FORMAT,\n    CAL_TYPE,\n    CENTER,\n    COORD_TYPE,\n    CSV_FORMAT,\n    ELEV_CUT,\n    ELM_LABELS,\n    EMAIL_ADDR,\n    EXTRA_PREC,\n    LHA_CUTOFF,\n    OUT_UNITS,\n    QUANTITIES,\n    RANGE_UNITS,\n    REF_PLANE,\n    REF_SYSTEM,\n    R_T_S_ONLY,\n    SITE_COORD,\n    SKIP_DAYLT,\n    SOLAR_ELONG,\n    START_TIME,\n    STEP_SIZE,\n    STOP_TIME,\n    SUPPRESS_RANGE_RATE,\n    TIME_DIGITS,\n    TIME_ZONE,\n    TLIST,\n    TLIST_TYPE,\n    TP_TYPE,\n    VEC_CORR,\n    VEC_DELTA_T,\n    VEC_LABELS,\n    VEC_TABLE,\n    format\n)\n\n\nFetch planetary ephemeris for the body specified by COMMAND, in the EPHEM_TYPE=\"OBSERVER\" format.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.fetch_properties-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_properties","text":"fetch_properties(COMMAND; file, EMAIL_ADDR, format)\n\n\nFetch physical attribute data for the body specified by COMMAND.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.fetch_spk-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_spk","text":"fetch_spk(\n    COMMAND;\n    file,\n    EMAIL_ADDR,\n    START_TIME,\n    STOP_TIME,\n    format\n)\n\n\nFetch planetary ephemeris for the body specified by COMMAND, in the EPHEM_TYPE=\"SPK\" format.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.fetch_vectors-Tuple{Any}","page":"Reference","title":"HorizonsAPI.fetch_vectors","text":"fetch_vectors(\n    COMMAND;\n    file,\n    AIRMASS,\n    ANG_FORMAT,\n    ANG_RATE_CUTOFF,\n    APPARENT,\n    CAL_FORMAT,\n    CAL_TYPE,\n    CENTER,\n    COORD_TYPE,\n    CSV_FORMAT,\n    ELEV_CUT,\n    ELM_LABELS,\n    EMAIL_ADDR,\n    EXTRA_PREC,\n    LHA_CUTOFF,\n    OUT_UNITS,\n    QUANTITIES,\n    RANGE_UNITS,\n    REF_PLANE,\n    REF_SYSTEM,\n    R_T_S_ONLY,\n    SITE_COORD,\n    SKIP_DAYLT,\n    SOLAR_ELONG,\n    START_TIME,\n    STEP_SIZE,\n    STOP_TIME,\n    SUPPRESS_RANGE_RATE,\n    TIME_DIGITS,\n    TIME_ZONE,\n    TLIST,\n    TLIST_TYPE,\n    TP_TYPE,\n    VEC_CORR,\n    VEC_DELTA_T,\n    VEC_LABELS,\n    VEC_TABLE,\n    format\n)\n\n\nFetch planetary ephemeris for the body specified by COMMAND, in the EPHEM_TYPE=\"VECTORS\" format.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.query-Tuple{Any}","page":"Reference","title":"HorizonsAPI.query","text":"query(COMMAND; options...)\n\n\nGiven keyword arguments which map to Horizons API parameters, construct a Vector{Pair} that is compatible with the query keyword argument of HTTP.get.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.request-Tuple{Any}","page":"Reference","title":"HorizonsAPI.request","text":"request(\n    COMMAND;\n    file,\n    A,\n    AIRMASS,\n    ANG_FORMAT,\n    ANG_RATE_CUTOFF,\n    APPARENT,\n    CALIM_PL,\n    CALIM_SB,\n    CAL_FORMAT,\n    CAL_TYPE,\n    CA_TABLE_TYPE,\n    CENTER,\n    COORD_TYPE,\n    CSV_FORMAT,\n    EC,\n    ECLIP,\n    ELEV_CUT,\n    ELM_LABELS,\n    EMAIL_ADDR,\n    EPHEM_TYPE,\n    EPOCH,\n    EXTRA_PREC,\n    IN,\n    LHA_CUTOFF,\n    MA,\n    MAKE_EPHEM,\n    N,\n    OBJECT,\n    OBJ_DATA,\n    OM,\n    OUT_UNITS,\n    QR,\n    QUANTITIES,\n    RANGE_UNITS,\n    REF_PLANE,\n    REF_SYSTEM,\n    R_T_S_ONLY,\n    SITE_COORD,\n    SKIP_DAYLT,\n    SOLAR_ELONG,\n    START_TIME,\n    STEP_SIZE,\n    STOP_TIME,\n    SUPPRESS_RANGE_RATE,\n    TCA3SG_LIMIT,\n    TIME_DIGITS,\n    TIME_ZONE,\n    TLIST,\n    TLIST_TYPE,\n    TP,\n    TP_TYPE,\n    VEC_CORR,\n    VEC_DELTA_T,\n    VEC_LABELS,\n    VEC_TABLE,\n    W,\n    format\n)\n\n\nReturn the requested Horizons data in the form of an HTTP.Response.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.to_kwargs-Tuple","page":"Reference","title":"HorizonsAPI.to_kwargs","text":"to_kwargs(parameters)\n\n\nReturn a sequence of Expr objects which represent a NamedTuple with a format that is compatible with keyword arguments in function definitions.\n\nExtended Help\n\nReferences:\n\nhttps://discourse.julialang.org/t/unpack-namedtuple-into-a-function-definition/97500/2\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.urlify-Tuple{Any}","page":"Reference","title":"HorizonsAPI.urlify","text":"urlify(x)\n\n\nThe Horizons API accepts very specific formatting for some strings. For example, setting the format option to \"text\" is fine, but \"'text'\" will cause the server to throw an error. Each method of urlify takes in a single argument, and outputs a string.\n\nThe one exception here is the method which takes an argument of type Missing; that method simply returns the singleton value missing to the option to be filtered out before the query is sent.\n\n\n\n\n\n","category":"method"},{"location":"reference/#HorizonsAPI.APPROACH_PARAMETERS","page":"Reference","title":"HorizonsAPI.APPROACH_PARAMETERS","text":"Parameters specific to close-approach requests, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.COMMON_PARAMETERS","page":"Reference","title":"HorizonsAPI.COMMON_PARAMETERS","text":"Common parameters, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.ELEMENTS_PARAMETERS","page":"Reference","title":"HorizonsAPI.ELEMENTS_PARAMETERS","text":"Parameters specific to user-requested heliocentric osculating orbital elements, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.ENDPOINT","page":"Reference","title":"HorizonsAPI.ENDPOINT","text":"The Horizons API endpoint.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.EPHEMERIS_PARAMETERS","page":"Reference","title":"HorizonsAPI.EPHEMERIS_PARAMETERS","text":"Ephemeris-specific parameters, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.SMALL_BODY_PARAMETERS","page":"Reference","title":"HorizonsAPI.SMALL_BODY_PARAMETERS","text":"Parameters specific to small-body ephemeris requests, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"reference/#HorizonsAPI.SPK_PARAMETERS","page":"Reference","title":"HorizonsAPI.SPK_PARAMETERS","text":"Parameters specific to spacecraft ephemeris, as specified by the Horizons API documentation.\n\n\n\n\n\n","category":"constant"},{"location":"examples/#Examples","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"The Horizons REST API accepts specific key-words for each type of command. Some keywords are common to all commands, but most keywords are only valid for some subset of available Horizons REST API commands. Thanks to Julia's metaprogramming, and helpful community, these keyword arguments are specified precisely in the signature of each fetch_* function. This allows users to simply press TAB in their chosen tab-completion-supporting IDE, and view all options that are available for each individual command.","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"julia> fetch_vectors(399; # <TAB>\n\nfetch_vectors(COMMAND; file, AIRMASS, ANG_FORMAT, ANG_RATE_CUTOFF, APPARENT, CAL_FORMAT, CAL_TYPE, CENTER, COORD_TYPE, CSV_FORMAT, ELEV_CUT, ELM_LABELS, EMAIL_ADDR, EXTRA_PREC, LHA_CUTOFF, OUT_UNITS, QUANTITIES, RANGE_UNITS, REF_PLANE, REF_SYSTEM, R_T_S_ONLY, SITE_COORD, SKIP_DAYLT, SOLAR_ELONG, START_TIME, STEP_SIZE, STOP_TIME, SUPPRESS_RANGE_RATE, TIME_DIGITS, TIME_ZONE, TLIST, TLIST_TYPE, TP_TYPE, VEC_CORR, VEC_DELTA_T, VEC_LABELS, VEC_TABLE, format) @ HorizonsAPI ~/Projects/Astrodynamics/HorizonsAPI.jl/src/HorizonsAPI.jl:317","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"Take a look at each of the following examples for ideas about how to use the Horizons REST API from within Julia.","category":"page"},{"location":"examples/#Cartesian-States","page":"Examples","title":"Cartesian States","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using HorizonsAPI\n\nfetch_vectors(\n    399; # NAIF ID for Earth's center of mass\n    START_TIME = \"2024-01-01\",\n    STOP_TIME = \"2025-01-01\",\n    STEP_SIZE = \"1d\", # one day\n    CENTER = \"@ssb\", # solar system barycenter\n    format = \"text\", # the \"text\" format is most useful; a minimal \"json\" format is also available\n    file = \"earth.txt\", # save the HTTP response contents to a local file\n)","category":"page"},{"location":"examples/#Orbital-Elements","page":"Examples","title":"Orbital Elements","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"using HorizonsAPI\n\nfetch_elements(\n    \"APOPHIS\";\n    EPOCH = \"J2000\",\n    format = \"text\",\n    file = \"apophis.txt\", # save the HTTP response contents to a local file\n)","category":"page"},{"location":"examples/#Idiomatic-Julia","page":"Examples","title":"Idiomatic Julia","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"You'll notice that HorizonsAPI only offers a Julia interface to the JPL Horizons REST API; without other packages, you'll need to parse the resulting ephemeris data on your own. Thankfully, HorizonsEphemeris provides ephemeris fetching methods which are fully abstracted from the REST API. For more information, see the HorizonsEphemeris documentation!","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"using Dates, HorizonsEphemeris\n\nearth = let start = now() - Year(50), stop = now() + Year(50), step = Day(1)\n    @time ephemeris(\"earth\", start, stop, step; wrt=\"jupiter\", units=\"AU-D\");\nend","category":"page"},{"location":"#HorizonsAPI.jl","page":"Overview","title":"HorizonsAPI.jl","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"Solar system ephemeris data for free!","category":"page"},{"location":"#Installation","page":"Overview","title":"Installation","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"Choose one of the following!","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"pkg> add HorizonsEphemeris","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"import Pkg\nPkg.add(\"HorizonsEphemeris\")","category":"page"},{"location":"#Overview","page":"Overview","title":"Overview","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"This project aims to implement the publicly accessible REST API for JPL's Horizons ephemeris platform. Once development is complete, this package will allow you to download physical attribute information, position and velocity data, binary files, and more from Horizons.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"warning: Warning\nThis project is not affiliated with or endorsed by NASA, JPL, Caltech, or any other organization!","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"Continue on to the Examples to learn more about how to use HorizonsAPI.jl.","category":"page"}]
}
