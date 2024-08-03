# About Ephemeris

The positions, velocities, and other attributes of physical objects in our
solar system are tracked by professionals around the world. NASA maintains two
sources for solar system ephemeris data: the
[Horizons](https://ssd.jpl.nasa.gov/horizons/) platform, and
[Generic SPICE Kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/)
updated (roughly) daily.

## JPL Horizons

Horizons allows for querying ephemeris for specific bodies at specific time
points through a REST interface, a graphical web interface, a `telnet`
command-line interface, and an email interface. Students commonly use the
graphical web interface, but programmatically fetching and processing ephemeris
data is useful for more formal and replicable analysis. The open-source packages
below allow for programmatic and interactive ephemeris fetching from the
JPL Horizons ephemeris platform. Packages marked **external** are not affiliated
with [`EphemerisSources.jl`](index.md).

| Package                                                                  | Description                                                                                                  | Location     |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ | ------------ |
| [`HorizonsAPI.jl`](https://github.com/JuliaAstro/HorizonsAPI.jl)             | A precise JPL Horizons REST API client implementation, with keyword arguments for each acceptable parameter. |              |
| [`HorizonsEphemeris.jl`](https://github.com/JuliaAstro/HorizonsEphemeris.jl) | Convenience wrappers around the JPL Horizons REST API.                                                       |              |
| [`Horizons.jl`](https://github.com/PerezHz/Horizons.jl)                  | Functions for spawning the `telnet` interface, and querying files.                                           | **external** |

## SPICE Toolkit

SPICE data is packaged in binary files referred to as
_kernels_. Kernel data can be parsed and processed with JPL's
[`CSPICE`](https://naif.jpl.nasa.gov/naif/toolkit.html) library. Users of the
Julia Programming Language can call `CSPICE` routines from within Julia with
[`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl).

| Package                                                                       | Description                                                                                             | Location     |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------ |
| [`SPICEKernels.jl`](https://github.com/JuliaAstro/SPICEKernels.jl)                | All [generic kernels](https://naif.jpl.nasa.gov/naif/data_generic.html) exported as variable constants. |              |
| [`SPICEBodies.jl`](https://github.com/JuliaAstro/SPICEBodies.jl)                  | Idiomatic wrappers around SPICE and [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) methods.       |              |
| [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl)                          | A Julia interface to the `CSPICE` library provided by NASA JPL.                                         | **external** |
| [`Ephemerides.jl`](https://github.com/JuliaSpaceMissionDesign/Ephemerides.jl) | Ephemeris kernel reading and interpolation in pure Julia.                                               | **external** |

## Getting Started

These two ephemeris platforms — Horizons and SPICE — are both free to use,
and have been incredibly helpful to students and researchers around the world.
The Julia packages above — and others — available to help you fetch and parse
ephemeris data. For more information on how to use these packages, continue on
to the documentation [**examples**](examples/index.md).
