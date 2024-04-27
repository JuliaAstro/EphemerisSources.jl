# `SPICEKernels.jl`

_Fetch NASA's generic SPICE kernels from within Julia!_

!!! warning
    This package is not affiliated with or endorsed by NASA, JPL, Caltech, or any other 
    organization! This is an independently written package by an astrodynamics hobbyist.

## Installation 

```julia
pkg> add SPICEKernels # or `Pkg.add("SPICEKernels")`
```

## Motivation

NASA provides generic SPICE kernels with the most common solar system bodies. These kernels,
which are available for download at <https://naif.jpl.nasa.gov/pub/naif/>, allow you to 
use the SPICE Toolkit to query solar system ephemeris data _locally_ in your kernel pool.
You can fetch position and velocity data for spacecraft and solar system bodies, get shapes 
and mass parameters for celestial bodies, convert to and from different coordinate frames, 
and more. But how do you know which kernel to download? And how can you reliably access 
each kernel, and ensure your colleagues are downloading _the same_ kernel?

`SPICEKernels.jl` provides a simple interface for downloading, caching, and inspecting
all of NASA's publicly available Generic Kernels. A continuous integration pipeline is 
used to check NASA's HTTP server every week, and any changes to the _names_ of the available
kernels result in a new patch version of this package.
The point is, if you're using this package, a simple `Pkg.update()`
ensures that all of the kernel links are up-to-date and working, and all of the kernel 
docstrings accurately describe their contents. Each kernel can be called like a function,
i.e. [`de440s()`](@ref); this returns a path to the kernel file, downloading it from NASA's 
server if necessary. As a result, you can pass each kernel right to `SPICE.jl`'s `furnsh` 
function for loading into the local kernel pool.

```@example
using SPICE, SPICEKernels

furnsh(
    de440s(),                   # position and velocity data for major solar system bodies
    latest_leapseconds_lsk(),   # timekeeping, parsing epochs
    gm_de440(),                 # mass parameters for major solar system bodies
    pck00011(),                 # physical properties of major solar system bodies
)
```

## Features

As mentioned above, each kernel can be _downloaded_, _cached_, and _inspected_ for the 
expected kernel contents. 

### Kernel Fetching

Each kernel is represented as an instance of a [`SPICEKernels.SPICEKernel`](@ref) subtype. All kernel 
types are _callable_, so you can call them like a function to download (if not previously
cached) the kernel file and return a path to the local file. By default, all kernels are 
cached to Julia's scratchspace: see [`SPICEKernels.SPICE_KERNEL_DIR`](@ref). You can override this 
behavior with the `ignorecache` keyword argument. You can copy the fetched ephemeris file 
to a new location by using the `directory` keyword argument. 

You can download kernels from other locations, both local and remote, by using the 
[`fetchkernel`](@ref) function; internally, each kernel type is calling this function!
So, while this package only provides instances for NASA's _generic kernels_, you can 
download any SPICE kernel that is accessible through a link. If you prefer to keep the 
kernel as a type for clarity in your code, you can construct your own kernels through the 
[`kernel`](@ref) function.

!!! warning "Kernel Caching"
    All kernel names are assumed to be unique. If you're uncertain about the state of your
    scratch space, you can clear it through `Scratch.clear_scratchspaces!(SPICEKernels)`.
    Alternatively, you can simply specify `ignorecache=true` to force a re-download.

## Inspection

During the kernel-updating continuous integration pipeline, SPICE Toolkit executables 
are used to attempt to inspect the contents of each kernel. The file size, SPICE executable
output, and the date of the inspection are all provided (most) kernels' docstrings. If 
you're wondering what ephemeris file to download, check the docstrings! For example, 
see the output below, which was produced using `v1.0` of this package.

```
help?> ?de440s
search: de440s de440 gm_de440 moon_de440_220930 moon_pa_de440_200625

  A SPK kernel of size 31.2 MB, linked from https://naif.jpl.nasa.gov [1]. Calling
  this variable like a function will return a path to the file, downloading to
  scratchspace if necessary.

  Extended Help
  ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

  This kernel's link was sourced on 2023-09-02.

  References
  ============

  [1] https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp

  Description
  =============

   
  BRIEF -- Version 4.1.0, September 17, 2021 -- Toolkit Version N0067
   
   
  Summary for: de440s.bsp
   
  Bodies: MERCURY BARYCENTER (1)  SATURN BARYCENTER (6)   MERCURY (199)
          VENUS BARYCENTER (2)    URANUS BARYCENTER (7)   VENUS (299)
          EARTH BARYCENTER (3)    NEPTUNE BARYCENTER (8)  MOON (301)
          MARS BARYCENTER (4)     PLUTO BARYCENTER (9)    EARTH (399)
          JUPITER BARYCENTER (5)  SUN (10)
          Start of Interval (ET)              End of Interval (ET)
          -----------------------------       -----------------------------
          1849 DEC 26 00:00:00.000            2150 JAN 22 00:00:00.000

```