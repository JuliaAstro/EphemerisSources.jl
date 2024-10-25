# SPICE Ephemeris Examples

The `SPICEBodies.KernelBody` type allows us to idiomatically query information
from the SPICE kernel pool. First, download some common generic kernels (such as
`de432s` below) and load them into the kernel pool with `SPICE.furnsh`. If you
want more information about what's in each kernel, inspect each kernel's
docstring; for example, `@doc de432s`, or `help?> de432s` in Julia's REPL. For 
a complete list of kernels available, look at the `SPICEKernels.jl`
[reference](https://juliaastro.org/EphemerisSources.jl/docs/SPICEKernels/dev/reference/#SPICEKernels.SPICEKernels).

```@example quickstart
using SPICE, SPICEKernels, SPICEBodies

return furnsh(
    de432s(),                   # position and velocity data for nearby planets
    latest_leapseconds_tls(),   # timekeeping, parsing epochs
    gm_de440(),                 # mass parameters for major solar system bodies
    pck00011(),                 # physical properties of major solar system bodies
)

earth = KernelBody("earth")
```

We can now call the `earth` variable like a function of time, and get back the
positions (and velocities) interpolated by `CSPICE` from the data in the kernel
pool.

```@example quickstart
using Dates

timepoints = DateTime(1950,1,1) : Month(1) : DateTime(2049,1,1)

states = earth.(timepoints)
```

Finally, let's plot the data we just collected.

```@example quickstart
using Plots

x = map(u -> u[begin], states)
y = map(u -> u[begin+1], states)

fig = scatter(
    x, y;
    label=nothing, markersize=1,
    xlabel="X (KM)", ylabel="Y (KM)", zlabel="Z (KM)",
    title="Earth's Position w.r.t. SSB",
    aspect_ratio=1, dpi = 125,
)
```

# Reference

You can find more information about `SPICEKernels` and `SPICEBodies` at 
their respective documentation pages, which are linked above in the website's 
navigation bar. For convenience, their pages are each linked below as well. 

| Documentation |
|---|
| [`SPICEKernels.jl`](https://juliaastro.org/EphemerisSources.jl/docs/SPICEKernels/stable) |
| [`SPICEBodies.jl`](https://juliaastro.org/EphemerisSources.jl/docs/SPICEBodies/stable) |
