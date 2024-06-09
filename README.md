[![Tests](https://github.com/cadojo/EphemerisSources.jl/actions/workflows/Tests.yml/badge.svg)](https://github.com/cadojo/EphemerisSources.jl/actions/workflows/Tests.yml)
[![Documentation](https://github.com/cadojo/EphemerisSources.jl/actions/workflows/Tests.yml/badge.svg)](https://github.com/cadojo/EphemerisSources.jl/actions/workflows/Documentation.yml)

# 🪐 `EphemerisSources.jl`

> [!IMPORTANT]
>
> The packages described in this documentation are not affiliated with or
> endorsed by NASA, JPL, Caltech, or any other organization! They are
> independently written packages by an astrodynamics hobbyist.

## Packages

This repository includes the top-level documentation for several solar system
ephemeris tools, all written with the Julia Programming Language. To learn
more about how to use these tools, consult the
[documentation website](https://ephemeris.loopy.codes), or visit each package
repository.

> [!NOTE]
>
> At this time, there is no package named `EphemerisSources.jl`. This repository
> hosts all of the packages shown below.

| Package                                                                  | Description                                                                                                  |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| [`HorizonsAPI.jl`](lib/HorizonsAPI)             | A precise JPL HORIZONS REST API client implementation, with keyword arguments for each acceptable parameter. |
| [`HorizonsEphemeris.jl`](lib/HorizonsEphemeris) | Convenience wrappers around the JPL HORIZONS REST API.                                                       |
| [`SPICEKernels.jl`](lib/SPICEKernels)           | All [generic kernels](https://naif.jpl.nasa.gov/naif/data_generic.html) exported as variable constants.      |
| [`SPICEBodies.jl`](lib/SPICEBodies)             | Idiomatic wrappers around SPICE and [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) methods.            |

## Paper

This repository holds a [JOSS](https://joss.theoj.org) submission under
[`paper/`](paper/paper.md). The paper is published to as a pre-print to
HTML, PDF, and Markdown on the [`gh-pages` branch](https://ephemeris.loopy.codes/paper).

## External Resources

Other Julia packages for interfacing with solar system ephemeris data are
available, including the three external packages below. These are not affiliated
with this repository, or this documentation's author.

| Package                                                                       | Description                                                        |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| [`Horizons.jl`](https://github.com/PerezHz/HORIZONS.jl)                       | Functions for spawning the `telnet` interface, and querying files. |
| [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl)                          | A Julia interface to the `CSPICE` library provided by NASA JPL.    |
| [`Ephemerides.jl`](https://github.com/JuliaSpaceMissionDesign/Ephemerides.jl) | Ephemeris kernel reading and interpolation in pure Julia.          |
