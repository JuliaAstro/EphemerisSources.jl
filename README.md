[![Tests](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Tests.yml/badge.svg)](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Tests.yml)
[![Documentation](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Documentation.yml/badge.svg)](https://juliaastro.org/EphemerisSources.jl/docs/stable)
[![JOSS](https://joss.theoj.org/papers/2ecaf389e70086ec2b560cb10f454267/status.svg)](https://joss.theoj.org/papers/2ecaf389e70086ec2b560cb10f454267)
<!-- [![CodeCov](https://codecov.io/gh/JuliaAstro/EphemerisSources.jl/graph/badge.svg?token=s71ZeTEo4F)](https://codecov.io/gh/JuliaAstro/EphemerisSources.jl) -->
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13895994.svg)](https://doi.org/10.5281/zenodo.13895994)

# 🪐 `EphemerisSources.jl`

> \[!IMPORTANT\]
>
> The packages described in this documentation are not affiliated with
> or endorsed by NASA, JPL, Caltech, or any other organization! They are
> independently written packages by an astrodynamics hobbyist.

## Installation

Choose one of the following, or manually install one or more of the
sub-packages below.

``` julia
pkg> add EphemerisSources
```

``` julia
import Pkg
Pkg.add("EphemerisSources")
```

## Overview

This project contains several [packages](#packages) which ease the
processes of ephemeris sourcing and parsing, and one top-level package:
`EphemerisSources.jl`. For usage examples, and instructions, please see
the project's [stable
documentation](https://juliaastro.org/EphemerisSources.jl/docs). Any
potential new features for this package will be released very quickly
after they are developed; the stable documentation will always track the
[in-development
documentation](https://JuliaAstro.org/EphemerisSources.jl/docs/dev)
closely.

## Contributions

Currently, this project only supports the fetching and parsing of
Cartesian state vectors from two ephemeris sources: NASA JPL's [Generic
Kernels](https://naif.jpl.nasa.gov/naif/data_generic.html), and NASA
JPL's [Horizons](https://ssd.jpl.nasa.gov/horizons/) platform. 
In addition, `EphemerisSources.jl` is very new, and test coverage is another 
major opportunity for improvement. This project welcomes all contributions and comments. 
If you would like to help add tests or parsing for the two other common ephemeris
formats — observer tables and osculating orbital elements — please add a
comment in an
[issue](https://github.com/JuliaAstro/EphemerisSources.jl/issues/41)! If
you find bugs, want to request features, or if you have any other
comments about the project's capabilities and code, please file an
[issue](https://github.com/JuliaAstro/EphemerisSources.jl/issues/new). Please 
treat all contributors with respect, as described in the project's 
[Code of Conduct](CODE_OF_CONDUCT.md).

## Packages

This repository includes the top-level documentation for several solar
system ephemeris tools, all written with the Julia Programming Language.
To learn more about how to use these tools, consult the [documentation
website](https://juliaastro.org/EphemerisSources.jl).

| Package | Description |
|--------------------|----------------------------------------------------|
| [`EphemerisSources.jl`](/) | A top-level package which provides, and re-exports, names from `HorizonsAPI`, `HorizonsEphemeris`, `SPICEKernels`, and `SPICEBodies`. |
| [`HorizonsAPI.jl`](/lib/HorizonsAPI) | A precise JPL Horizons REST API client implementation, with keyword arguments for each acceptable parameter. |
| [`HorizonsEphemeris.jl`](/lib/HorizonsEphemeris) | Convenience wrappers around the JPL Horizons REST API. |
| [`SPICEKernels.jl`](/lib/SPICEKernels) | All [generic kernels](https://naif.jpl.nasa.gov/naif/data_generic.html) exported as variable constants. |
| [`SPICEBodies.jl`](/lib/SPICEBodies) | Idiomatic wrappers around SPICE and [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) methods. |

## Paper

This repository holds a [JOSS](https://joss.theoj.org) submission under
[`paper/`](paper/paper.md). The paper is published to as a pre-print to
HTML, PDF, and Markdown on the [`gh-pages`
branch](https://juliaastro.org/EphemerisSources.jl/paper).

## External Resources

Other Julia packages for interfacing with solar system ephemeris data
are available, including the three external packages below. These are
not affiliated with this repository, or this documentation's author.

| Package | Description |
|---------------------------------------|---------------------------------|
| [`HORIZONS.jl`](https://github.com/PerezHz/Horizons.jl) | Functions for spawning the `telnet` interface, and querying files. |
| [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) | A Julia interface to the `CSPICE` library provided by NASA JPL. |
| [`Ephemerides.jl`](https://github.com/JuliaSpaceMissionDesign/Ephemerides.jl) | Ephemeris kernel reading and interpolation in pure Julia. |
