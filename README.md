[![Tests](https://github.com/cadojo/HorizonsEphemeris.jl/workflows/UnitTests/badge.svg)](https://github.com/cadojo/HorizonsEphemeris.jl/actions?query=workflow%3AUnitTests)
[![Docs](https://github.com/cadojo/HorizonsEphemeris.jl/workflows/Documentation/badge.svg)](https://cadojo.github.io/HorizonsEphemeris.jl)
[![SciML Code Style](https://img.shields.io/static/v1?label=Style&message=SciML&color=9668e2&labelColor=3E474F)](https://github.com/SciML/SciMLStyle)

# `HorizonsEphemeris`

_A wrapper around the [wrapper](https://github.com/cadojo/HorizonsAPI.jl) around
JPL's REST API for the HORIZONS solar system ephemeris platform!_

> **Warning**
>
> This package is not affiliated with or endorsed by NASA, JPL, Caltech, or any
> other organization! This is an independently written package by an
> astrodynamics hobbyist. For more information about code sharing and usage, see
> the `HorizonsEphemeris.jl` [license file](./LICENSE).

## Installation

Choose one of the following two lines!

```julia
julia> ]add HorizonsEphemeris

julia> import Pkg; Pkg.add("HorizonsEphemeris");
```

## Usage

As of `v0.1`, only Cartesian vectors are supported. You can query the
`ephemeris` function with any solar system body name, or
[NAIF code](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/naif_ids.html);
`HorizonsEphemeris` uses [`SPICE`](https://github.com/JuliaAstro/SPICE.jl) under
the hood to return the appropriate Horizons-compatible NAIF code. After
providing the desired solar system body, specify the start time, stop time, and
step size for which you want ephemeris data. You'll receive a `NamedTuple` in
return, with keys defaulting to: `[:MJD, :Calendar, :X, :Y, :Z, :ΔX, :ΔY, :ΔZ]`.
The labels for each key can be changed with the `header` keyword. For example,
to get rid of the Unicode character keys, specify
`header=[:MJD, :Calendar, :X, :Y, :Z, :DX, :DY, :DZ]`. This `NamedTuple` output
is automatically compatible with `DataFrames`. Finally, use the `file` keyword
argument to write the resulting ephemeris data, with labels, to a provided
filename as a CSV file.

```julia
julia> using Plots, Dates, HorizonsEphemeris

julia> earth = let start = now() - Year(50), stop = now() + Year(50), step = Day(1)
           @time ephemeris("earth", start, stop, step; wrt="jupiter", units="AU-D");
       end
  6.376672 seconds (19.78 k allocations: 21.253 MiB)

julia> plot(
           earth.X, earth.Y;
           aspect_ratio = 1,
           linewidth = 1.5,
           border = :none,
           size = (600, 600),
           dpi = 200,
           grid = false,
           axis = nothing,
           title = "",
           label=:none,
           color = "green",
           background=:transparent,
       )
```

![](img/earth-shakin-it.png)
