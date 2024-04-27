[![Tests](https://github.com/cadojo/HorizonsAPI.jl/workflows/Tests/badge.svg)](https://github.com/cadojo/HorizonsAPI.jl/actions?query=workflow%3ATests)
[![Docs](https://github.com/cadojo/HorizonsAPI.jl/workflows/Documentation/badge.svg)](https://docs.loopy.software/HorizonsAPI.jl)
[![SciML Code Style](https://img.shields.io/static/v1?label=Style&message=SciML&color=9668e2&labelColor=3E474F)](https://github.com/SciML/SciMLStyle)

# `HorizonsAPI`

_A wrapper around JPL's REST API for the HORIZONS solar system ephemeris
platform!_

> **Warning**
>
> This package is not affiliated with or endorsed by NASA, JPL, Caltech, or any
> other organization! This is an independently written package by an
> astrodynamics hobbyist. See the `HorizonsAPI.jl` [license file](./LICENSE) for
> more information about code sharing and usage!

## Overview

The [NASA Jet Propulsion Laboratory](https://www.jpl.nasa.gov) (JPL), located at
the [California Institute of Technology](https://www.caltech.edu), provides a
solar system ephemeris service called _HORIZONS_. It's fantastic! It can
[find](https://ssd.jpl.nasa.gov/tools/periodic_orbits.html) and
[visualize](https://ssd.jpl.nasa.gov/tools/orbit_diagram.html) periodic orbits,
allow you to [download](https://ssd.jpl.nasa.gov/ephem.html) position and
velocity data for bodies in our solar system, list
[physical parameters](https://ssd.jpl.nasa.gov/sats/phys_par/) for celestial
bodies, and more!

You may utilize these tools using several methods, including through a
[web interface](https://ssd.jpl.nasa.gov/horizons/app.html), with telnet via
`telnet ssd.jpl.nasa.gov 6775`, and even through
[email](horizons@ssd.jpl.nasa.gov?subject=BATCH-LONG)! You can consult the
HORIZONS [documentation](https://ssd.jpl.nasa.gov/horizons/manual.html) for more
information.

In 2021, JPL released a
[REST](https://www.redhat.com/en/topics/api/what-is-a-rest-api) API which allows
users to programatically interact with HORIZONS through HTTP requests. This API
is **also** described in the HORIZONS
[documentation](https://ssd-api.jpl.nasa.gov/doc/horizons.html). This Julia
package provides an interface to the HORIZONS REST API.

## Limitations

Note that JPL Horizons ephemeris accuracy for major planetary bodies in the
solar system
[may have errors larger than 1000km](https://ssd.jpl.nasa.gov/horizons/manual.html#limits)
at some times!

## Context

This package matches the precise interace, which matches the syntax of the
requests described in the HORIZONS
[documentation](https://ssd-api.jpl.nasa.gov/doc/horizons.html). In addition, a
more Julian syntax for ephemeris downloading and processing is provided in a
separate interface:
[`HorizonsEphemeris.jl`](https://github.com/cadojo/HorizonsEphemeris.jl).

## Credits

This package uses [`HTTP.jl`](https://github.com/JuliaWeb/HTTP.jl) to process
all HTTP requests and responses!
