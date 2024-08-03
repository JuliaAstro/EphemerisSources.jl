# Horizons Ephemeris Examples

The JPL Horizons platform provides ephemeris data as Cartesian state vectors,
osculating orbital elements, and other representations. The precise
[REST API](https://ssd-api.jpl.nasa.gov/doc/horizons.html)
accepted by the JPL Horizons servers is implemented in Julia with `HorizonsAPI.jl`.

```@repl horizons-examples
using HorizonsAPI

fetch_vectors(399; format="text") # Earth's position w.r.t. the solar system barycenter
```

The `CENTER` parameter specifies the ephemeris reference position.

```@repl horizons-examples
fetch_vectors(499; format="text", CENTER="@399") # Mars' position w.r.t. Earth
```

The response from the Horizons API contains a lot of information! To more simply
fetch and inspect ephemeris data from JPL Horizons servers, use the `ephemeris`
method in `HorizonsEphemeris.jl`.

```@repl horizons-examples
using Dates, HorizonsEphemeris

ephemeris("earth", now())
```

The output of `ephemeris` is a `NamedTuple`, so you can easily pass it along to
`DataFrames.jl` for convenient inspection & data processing. Note the `wrt`
keyword argument as well; it is a simplified interface to the Horizons API
`CENTER` argument.

```@repl horizons-examples
using DataFrames

data = DataFrame(
    ephemeris("earth", now() - Year(50), now() + Year(5), Day(1); wrt="jupiter")
)
```

This example wouldn't be complete without some plotting!

```@repl horizons-examples
using Plots

figure = plot(
    data.x, data.y;
    xlabel="X (KM)", ylabel="Y (KM)", label=:none,
    title="Earth's Position w.r.t. Jupiter"
);
```

```@repl horizons-examples
figure # hide
```

# Reference

You can find more information about `HorizonsAPI` and `HorizonsEphemeris` at 
their respective documentation pages, which are linked above in the website's 
navigation bar. For convenience, their pages are each linked below as well. 

| Documentation |
| [`HorizonsAPI.jl`](docs/HorizonsAPI.jl/docs/stable) |
| [`HorizonsEphemeris.jl`](docs/HorizonsEphemeris.jl/docs/stable) |