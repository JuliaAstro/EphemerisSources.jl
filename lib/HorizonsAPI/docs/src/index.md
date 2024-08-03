# `HorizonsAPI.jl`

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

This project aims to implement the publicly accessible REST API for JPL's
[Horizons](https://ssd-api.jpl.nasa.gov/doc/horizons.html) ephemeris platform. Once
development is complete, this package will allow you to download physical
attribute information, position and velocity data, binary files, and more from
Horizons.

!!! warning 
    This project is not affiliated with or endorsed by NASA, JPL, Caltech, or any
    other organization!

Continue on to the [**Examples**](examples/index.md) to learn more
about how to use `HorizonsAPI.jl`.
