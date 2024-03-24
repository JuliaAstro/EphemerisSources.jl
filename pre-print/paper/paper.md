---
title: "EphemerisSources.jl: Idiomatic Ephemeris Sourcing and Parsing in Julia"

tags:
  - Astrodynamics
  - Astronomy
  - Astrophysics
  - Ephemeris
  - Julia
  - SPICE
  - Horizons

authors:
  - name: Joseph D. Carpinelli
    orcid: 0000-0001-8655-8125
    email: joseph.d.carpinelli@loopy.codes
    affiliations:
    - name: Independent Researcher, USA

date: 21 April 2024
bibliography: references.bib
---

# Summary

Students and professionals in astronomy, astrodynamics, astrophysics,
and other related fields often download and parse data about objects in
our solar system --- ephemeris data --- from two major providers: JPL's
publicly-available [Generic SPICE
Kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/) and JPL's
[Horizons platform](https://ssd.jpl.nasa.gov/horizons/). SPICE kernels
are typically read through the SPICE Toolkit, which is available in a
variety of programming languages, including the C Programming Language
with `CSPICE` [@cspice]. The Julia packages
[`CSPICE_jll.jl`](https://github.com/JuliaBinaryWrappers/CSPICE_jll.jl)
and [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) expose many
`CSPICE` functions through Julia functions. Julia users can load and
interact with SPICE kernels through methods such as `SPICE.furnsh` and
`SPICE.spkez`. Horizons provides data through a variety of methods,
including email, command-line, graphical web interfaces, and a [REST
API](https://ssd-api.jpl.nasa.gov/doc/horizons.html) [@horizons].

This paper introduces several packages --- `SPICEKernels.jl`,
`SPICEBodies.jl`, `HorizonsAPI.jl` and `HorizonsEphemeris.jl` --- which
allow users to download and process Cartesian state vector data
idiomatically, all from within Julia. While ephemeris data comes in many
forms, including observer tables, osculating orbital elements, and
binary formats, these packages currently target Cartesian state vector
(position and velocity) ephemeris data. Through the use of these
packages, users can share replicable code which automatically fetches
data from publicly-available ephemeris sources, as opposed to manually
including ephemeris data files with their source code distribution.

# Statement of Need

While astronomers, astrodynamicists, and other ephemeris users have the
tools they need to fetch and parse position and velocity data from
multiple sources within Julia, they do not have the tools to do so
*simply* or *idiomatically*. Horizons' ephemeris data is distributed in
plain text with surrounding metadata, and manual parsing is required for
users to programmatically use the fetched ephemeris data. Generic SPICE
kernels are freely available and can be used with `CSPICE` (and wrapper
libraries) for kernel inspection and data retrieval, but new users and
students may find the required workflows unfamiliar. The packages
presented in this paper may be used by students and professionals to
idiomatically inspect and use Cartesian state vector ephemeris data,
without prior knowledge of SPICE Toolkit utilities or REST APIs.

## JPL Horizons

The two Horizons-related packages presented in this paper ---
[`HorizonsAPI.jl`](https://github.com/JuliaAstro/EphemerisSources.jl/tree/main/lib/HorizonsAPI)
and
[`HorizonsEphemeris.jl`](https://github.com/JuliaAstro/EphemerisSources.jl/tree/main/lib/HorizonsEphemeris)
--- are respectively the first Julia packages to precisely match the
REST API with tab-completion through *static keyword arguments*[^1], and
the first to offer automatic response parsing into `NamedTuple` types.
The `NamedTuple` output of `HorizonsEphemeris.ephemeris`, the top-level
method for fetching Cartesian state vectors from the Horizons platform,
allows for easy plotting, CSV file-saving, and `DataFrame` construction.
Both `HorizonsAPI.jl` and `HorizonsEphemeris.jl` offer users a simple,
repeatable way to query and parse Horizons state vector data. Parsing for other
ephemeris types, including observer tables and osculating orbital
element tables, are desired features but are not yet implemented. For
sending Horizons requests for these other ephemeris types, use `HorizonsAPI` 
methods to manually construct each request, 
or see [`Horizons.jl`](https://github.com/PerezHz/Horizons.jl).

[^1]: The code required to support static keyword arguments was provided
    by Joseph Wilson, as described in the **Acknowledgements** section.

## JPL SPICE

The two SPICE-related packages presented in this paper ---
[`SPICEKernels.jl`](https://github.com/JuliaAstro/EphemerisSources.jl/tree/main/lib/SPICEKernels),
and
[`SPICEBodies.jl`](https://github.com/JuliaAstro/EphemerisSources.jl/tree/main/lib/SPICEBodies)
--- provide idiomatic kernel fetching, inspection, and caching from
within Julia. Previously, Julia users interacted with SPICE kernels by
manually downloading publicly-available [generic
kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/) and
parsing the data using `SPICE.jl`, or another ephemeris parsing source.
This workflow requires that users know how to find the appropriate generic
kernels for their chosen application, and that they know how to use
CSPICE functions to retrieve their desired data. `SPICEKernels.jl` and
`SPICEBodies.jl` offer idiomatic interfaces to ephemeris fetching and
parsing respectively. The `SPICEKernels.jl` project uses
continuous integration to fetch and parse publicly-available
[kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels) and
expose each kernel as a variable in a new package release. SPICE Toolkit
executables, provided by
[`SPICEApplications.jl`](https://github.com/JuliaAstro/SPICE.jl/tree/main/lib/SPICEApplications),
are used to fill each corresponding kernel variable's docstring with a description
of the kernel's contents.
`SPICEKernels.jl` users can utilize tab-completion and Julia's built-in
documentation tools to help select the most appropriate
generic kernel for their application. Once each kernel is
loaded into the SPICE kernel pool with `SPICE.jl`, users can use
`SPICEBodies.jl` to idiomatically fetch state vector data at provided epochs.

# Usage

For detailed usage examples, consult the common [documentation
site](https://juliaastro.org/EphemerisSources.jl).

# External Packages

The packages presented in this paper which interact with the SPICE
Toolkit require users to use
[`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl), or another
SPICE-compatible kernel loading tool. `SPICEBodies.jl` uses the kernel cache
that is created with `SPICE.furnsh`. Support for other SPICE kernel
management packages, such as
[`Ephemerides.jl`](https://github.com/JuliaSpaceMissionDesign/Ephemerides.jl),
may be added in the future. Support for `Ephemerides.jl` is particularly
desirable, as it enables fetching kernel data in multi-threaded
contexts. In addition to the packages in this paper which interface with
the JPL Horizons ephemeris platform, the
[`Horizons.jl`](https://github.com/PerezHz/Horizons.jl) package offers
simplified interfaces for constructing and sending queries to the JPL
Horizons REST API. The `Horizons.jl` package provides support for all
Horizons query types, as does `HorizonsAPI.jl`. As stated previously,
`HorizonsEphemeris.jl` currently only supports parsing for Cartesian
state vector data.

# Acknowledgements {#sec-acknowledgements}

Joseph Wilson (user `@jollywatt` on Julia's
[Discourse](https://discourse.julialang.org/u/Jollywatt/summary))
provided incredibly helpful [guidance and
code](https://discourse.julialang.org/t/unpack-namedtuple-into-a-function-definition/97500)
to support static keyword arguments. This contribution substantially
improved the usability of `HorizonsAPI.jl`.

# Disclaimers

The software developed in this paper, and the paper itself, was written
by the author in a personal capacity. This work does not reflect the
views of any organization, employer, or entity, except for the author as
an individual.

# References
