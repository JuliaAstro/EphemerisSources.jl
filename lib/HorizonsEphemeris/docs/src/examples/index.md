# Examples

`HorizonsEphemeris.jl` provides an idiomatic Julia interface to the JPL Horizons
REST API. Rather than recall specific queries REST API queries, or describe your
desired ephemeris data in the verbose REST interface through `HorizonsAPI.jl`,
you can use the [`ephemeris`](@ref HorizonsEphemeris.ephemeris) method to fetch
send the correct REST query (using `HorizonsAPI.jl` under the hood), and return
the data parsed into a `NamedTuple` for convenient data processing.

Take a look at each of the following examples for ideas about how to use the
Horizons platform idiomatically from within Julia.

!!! warning
    At this time, only Cartesian state vectors are supported in
    `HorizonsEphemeris.jl`. If you want to fetch more complicated ephemeris
    data, use `HorizonsAPI.jl`.

### Object Identification

The SPICE Toolkit (with `SPICE.jl`) is used under the hood to identify celestial
bodies by their name, or by their NAIF ID code. You can use the [`NAIF`](@ref)
method to query an object's code, or the code's corresponding object name.

```@repl
using HorizonsEphemeris
using DataFrames

names = ["solar system barycenter", "sun", "mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune", "pluto"];

codes = NAIF.(names);

DataFrame(Name = names, Code = codes)
```

### Cartesian States

You can specify a single time point, e.g. `now()`, or a list of time points,
or the combination of a start time, end time, and step duration. Each time
point can be a string, a Julia day or Modified Julian day (`AbstractFloat`), or
an `AbstractDateTime`. For more information, see the [`ephemeris`](@ref)
reference.

```@repl
using HorizonsEphemeris

ephemeris("earth", "1999-12-31T11:59:59")
```

### `DataFrame` Support

If you include `DataFrames.jl`, you can use the `DataFrame` constructor with
the `NamedTuple` output of the `ephemeris` method.

```@repl
using Dates, HorizonsEphemeris
using DataFrames

data = ephemeris("earth", now() - Year(1), now() + Year(1), Day(1); wrt="sun")

DataFrame(data)
```

### CSV Support

You can save the ephemeris content to a CSV file using the `file` keyword
argument.

```@repl
using HorizonsEphemeris

ephemeris("moon", 0.0; wrt="earth", mjd=true, file="moon.csv")
```
