---
title: Idiomatic Ephemeris Sourcing and Parsing in Julia

tags:
  - astrodynamics
  - astronomy
  - astrophysics
  - ephemeris
  - Julia
  - SPICE
  - Horizons

authors:
  - name: Joseph D Carpinelli
    orcid: 0000-0001-8655-8125
    email: joseph.d.carpinelli@loopy.codes
    affiliations:
      - ref: 1
    affiliation: 1

affiliations:
  - name: Independent Researcher, USA
    index: 1
    id: 1

date: 09 June 2024
bibliography: references.bib
---

# Summary

Students and professionals in astronomy, astrodynamics, astrophysics, and other
related fields often download and parse data about objects in our solar system
--- ephemeris data --- from two major providers:
JPL's publicly available [Generic SPICE Kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/),
and JPL's [Horizons platform](https://ssd.jpl.nasa.gov/horizons/). SPICE kernels are
typically read through the SPICE Toolkit, which is available in a variety of
programming languages, include the C Programming Language with `CSPICE` [@cspice].
The Julia packages [`CSPICE_jll.jl`](https://github.com/JuliaBinaryWrappers/CSPICE_jll.jl)
and [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl) expose many `CSPICE`
functions through Julia functions. Julia users can load and interact with SPICE
kernels through methods such as `SPICE.furnsh` and `SPICE.spkez`.
Horizons data is available through
a variety of methods, including email, command-line, graphical web interfaces,
and a [REST API](https://ssd-api.jpl.nasa.gov/doc/horizons.html) [@horizons].

This paper introduces several packages --- `SPICEKernels.jl`, `SPICEBodies.jl`,
`HorizonsAPI.jl` and `HorizonsEphemeris.jl` --- which allow users to download and process
ephemeris data idiomatically, all from within Julia.
Through the use of these packages, users can share replicatable code which
automatically fetches publicly available ephemeris data, as opposed to manually
including ephemeris data files with their source code distribution.

# Statement of Need

While ephemeris users have the tools they need to fetch and parse ephemeris
data from multiple sources within Julia, they do not have the tools to do so
_simply_ or _idiomatically_. Horizons ephemeris data is distributed in plain text with
surrounding metadata, and manual parsing is required for users to programmatically
use the fetched ephemeris data. Generic SPICE kernels are freely available, and
can be used with`CSPICE` (and wrapper libraries) for kernel inspection and data
retrieval, but new users and students may find the required workflows unfamiliar.
The packages presented in this paper may be used by students and professionals
to idiomatically inspect and use ephemeris data, without prior knowledge of SPICE
Toolkit utilities or REST APIs.

### JPL HORIZONS

The two HORIZONS-related packages presented in this paper ---
[`HorizonsAPI.jl`](https://github.com/cadojo/EphemerisSources.jl/tree/main/lib/HorizonsAPI)
and [`HorizonsEphemeris.jl`](https://github.com/cadojo/EphemerisSources.jl/tree/main/lib/HorizonsEphemeris) ---
are respectively the first Julia packages to precisely match the REST API with
tab-completion through _static keyword arguments_[^1], and the first to offer
automatic response parsing into `NamedTuple` types. The `NamedTuple` output of
`HorizonsEphemeris.ephemeris`, the top-level method for fetching Cartesian state
vectors from the HORIZONS platform, allows for easy plotting, file-saving, and
`DataFrame` construction. Both `HorizonsAPI.jl` and `HorizonsEphemeris.jl` offer
users a simple, repeatable way to query and parse HORIZONS ephemeris data.

[^1]:
    The code required to support static keyword arguments was provided by
    Joseph Wilson, as described in the **Acknowledgements** section.

## JPL SPICE

The two SPICE-related packages presented in this paper ---
[`SPICEKernels.jl`](https://github.com/cadojo/EphemerisSources.jl/tree/main/lib/SPICEKernels), and
[`SPICEBodies.jl`](https://github.com/cadojo/EphemerisSources.jl/tree/main/lib/SPICEBodies) --- provide
idiomatic kernel fetching, inspection, and caching from within Julia.
Julia users interact with SPICE kernels by downloading publicly-available
a[Generic Kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/), and
parsing the data using `SPICE.jl`, or another ephemeris parsing source. This
workflow requires that users know how to find the correct generic kernels for
their chosen application, and that they know how to use CSPICE functions to
retrieve their desired data. `SPICEKernels.jl` and `SPICEBodies.jl` offer
idiomatic interfaces to ephemeris fetching and parsing parsing respectively.
Continuous integration in the
[`SPICEKernels.jl` repository](https://github.com/cadojo/EphemerisSources.jl/tree/main/.github/workflows/SPICE.yml)
multiple times daily, and automatically exports all available generic kernels
as variables in Julia. SPICE Toolkit executables (provided by
[`SPICEApplications.jl`](https://github.com/cadojo/SPICEApplications.jl))
are used to retrieve a description of each kernel's
contents, and place that description in the Julia variable's docstring. As a
result, users can use tab-completion and Julia's built-in documentation tools
to inspect kernel contents, and download the correct kernel for their
application. Once each kernel is downloaded and loaded into the SPICE kernel pool
with `SPICE.jl`, users can use `SPICEBodies.jl` to idiomatically fetch data at
a provided instance in time.

# Usage

For detailed usage examples for, consult the common
[documentation site](https://ephemeris.loopy.codes).

# External Packages

The packages presented in this paper which interact with the SPICE Toolkit
require users to use [`SPICE.jl`](https://github.com/JuliaAstro/SPICe.jl),
or another SPICE-compatible kernel loading tool. Support for other SPICE
kernel management packages, such as
[`Ephemerides.jl`](https://github.com/JuliaSpaceMissionDesign/Ephemerides.jl),
may be added in the future.
In addition to the packages in this paper which interface with the JPL HORIZONS
ephemeris platform, the [`HORIZONS.JL`](https://github.com/PerezHz/HORIZONS.jl)
package offers simplified interfaces for constructing and sending queries to the
JPL HORIZONS REST API.

# Acknowledgements {#sec-acknowledgements}

Joseph Wilson (user `@jollywatt` on [GitHub](https://github.com/jollywatt) and
Julia's [Discourse](https://discourse.julialang.org/u/Jollywatt/summary)), provided
incredibly helpful [guidance and code](https://discourse.julialang.org/t/unpack-namedtuple-into-a-function-definition/97500) to support static keyword arguments.
This contribution substantially improved the usability of `HorizonsAPI.jl`.
The software developed in this paper, and the paper itself, was written by the
author in a personal capacity. This work does not reflect the views of any
organization, employer, or entity, except for the author as an individual.

# References
