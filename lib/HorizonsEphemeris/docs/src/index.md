# `HorizonsEphemeris.jl`

_Solar system ephemeris data for free!_

## Installation

Choose one of the following!

```julia
pkg> add HorizonsEphemeris
```

```julia
import Pkg
Pkg.add("HorizonsEphemeris")
```

## Overview

While `HorizonsAPI.jl` provides a precise interface which matches the JPL Horizons API,
`HorizonsEphemeris.jl` provides a more user-friendly way to request solar system ephemeris
data. At this time, only Cartesian state vector ephemeris data is available
through the `HorizonsEphemeris.jl` interface.

!!! warning
    This project is not affiliated with or endorsed by NASA, JPL, Caltech, or any
    other organization!

For more information, read on to the [**Examples**](examples/index.md) page,
or the package [**Reference**](reference/index.md).

## NAIF IDs

Internally, `HorizonsEphemeris` converts provided names to NAIF IDs. All 
compatible bodies are shown below.

```@example
using SPICE, DataFrames

names = (; ID=Int[], Name=String[])

for id in range(-100000, 100000)
    name = bodc2n(id)
    isnothing(name) && continue
    push!(names.ID, id)
    push!(names.Name, name)
end

DataFrame(names)
```
