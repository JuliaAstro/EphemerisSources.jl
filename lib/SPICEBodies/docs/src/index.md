# `SPICEBodies.jl`

_Interact with SPICE kernels without learning the SPICE interface in-full!_

## Installation

Choose one of the following!

```julia
pkg> add SPICEBodies
```

```julia
import Pkg
Pkg.add("SPICEBodies")
```

## Usage

This package requires [`SPICE.jl`](https://github.com/JuliaAstro/SPICE.jl);  
[`SPICEKernels.jl`](https://github.com/JuliaAstro/SPICEKernels.jl). Once you load your desired
SPICE kernels, you _could_ interact with each kernel object (satellite, planet, barycenter,
lagrange point, etc.) using the SPICE interface. In fact, if you want to do anything more
complicated than retrieve some physical parameters, and request Cartesian-state ephemeris
data, you probably **should** use the SPICE toolkit! If, however, your desired usage falls
within the narrow limitations mentioned above, `SPICEBodies.jl` could help you to
concisely retrieve solar system ephemeris data.

First, load your desired SPICE kernels using `SPICE.jl`. `SPICEKernels.jl` provides an
easy Julian interface for downloading (and caching) NASA's publicly available
[Generic Kernels](https://naif.jpl.nasa.gov/pub/naif/generic_kernels). All generic kernels
are available as callable `struct`s within `SPICEKernels.jl`. If you'd like to know what
each kernel does, check the _Extended Help_ in each kernel's docstring.

```repl usage
julia> using SPICE: furnsh

julia> using SPICEKernels

julia> furnsh(
           de440(),                    # position and velocity data for major solar system bodies
           latest_leapseconds_lsk(),   # timekeeping
           gm_de440(),                 # mass parameters for major solar system bodies
           pck00011(),                 # physical properties of major solar system bodies
       )
```

Now you're ready to use `SPICEBodies.jl`. To retrieve position and velocity data, you
must construct a `KernelBody` instance, or implement the `AbstractKernelBody` interface
yourself! To retrieve physical characteristics, or NAIF ID codes, you can provide
`AbstractKernelBody` instances, or the body's name.

```repl usage
julia> using AstroTime, SPICEBodies

julia> earth = KernelBody("earth")
KernelBody(399)

julia> moon = KernelBody("moon")
KernelBody(301)

julia> x, y, z, ẋ, ẏ, ż = earth(AstroTime.J2000_EPOCH, wrt=moon)
6-element Vector{Float64}:
 291608.38463343546
 266716.83339423337
  76102.48709990202
     -0.6435313877190327
      0.6660876840916304
      0.30132570498227307

julia> μ = gm("earth")
398600.4355070226

julia> R = radii(moon)
3-element Vector{Float64}:
 1737.4
 1737.4
 1737.4
```
