[![Tests](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Tests.yml/badge.svg)](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Tests.yml)
[![Documentation](https://github.com/JuliaAstro/EphemerisSources.jl/actions/workflows/Documentation.yml/badge.svg)](https://juliaastro.org/EphemerisSources.jl/docs/SPICEBodies/stable)

# `SPICEBodies`

_A wrapper around NAIF's SPICE kernel solar system ephemeris platform!_

> **Warning**
>
> This package is not affiliated with or endorsed by NASA, JPL, Caltech, or any
> other organization! This is an independently written package by an
> astrodynamics hobbyist. See the `SPICEBodies.jl` [license file](./LICENSE) for
> more information about code sharing and usage!

## Overview

This package provides a simpler interface to SPICE ephemeris data retrieval for celestial 
bodies, spacecraft, stationary points, barycenters, and more; all referred to under the 
umbrella term _bodies_. When used with [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl),
this package provides a thin wrapper around SPICE toolkit functions that retrieve state vector
data, and physical parameters from the SPICE kernel pool. When combined with 
[`SPICEKernels.jl`](https://github.com/JuliaAstro/SPICEKernels.jl), you can download, load, 
and use SPICE kernels all from within Julia!

## Installation

```julia
pkg> add SPICEBodies
```

## Getting Stated

Please refer to the [documentation](https://juliaastro.org/SPICEBodies.jl) for more 
detailed instructions, and usage examples.

```julia
julia> using SPICE: furnsh

julia> using SPICEKernels

julia> furnsh(
           de440(),                    # position and velocity data for major solar system bodies
           latest_leapseconds_lsk(),   # timekeeping
           gm_de440(),                 # mass parameters for major solar system bodies
           pck00011(),                 # physical properties of major solar system bodies
       )

julia> earth = KernelBody("earth")
KernelBody(399)

julia> x, y, z, ẋ, ẏ, ż = earth(AstroTime.J2000_EPOCH, wrt="moon")
6-element Vector{Float64}:
 291608.38463343546
 266716.83339423337
  76102.48709990202
     -0.6435313877190327
      0.6660876840916304
      0.30132570498227307
```

