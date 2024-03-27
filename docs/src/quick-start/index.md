# Quick Start

Navigating ephemeris platforms — and processing ephemeris data — can sometimes
have a steep learning curve. This page will help you get up and running with
loading and plotting ephemeris. For more detailed information, check out the
documentation [**examples**](../examples/index.md), or documentation pages
for each individual package in the drop-down menu.

The `SPICEBodies.KernelBody` type allows us to idiomatically query information
from the SPICE kernel pool. First, download some common generic kernels (such as
`de432s` below) and load them into the kernel pool with `SPICE.furnsh`. If you
want more information about what's in each kernel, inspect each kernel's
docstring; for example, `@doc de432s`, or `help?> de432s` in Julia's REPL.

```@repl quickstart
using SPICE, SPICEKernels, SPICEBodies

return furnsh(
    de432s(),                   # position and velocity data for nearby planets
    latest_leapseconds_lsk(),   # timekeeping, parsing epochs
    gm_de440(),                 # mass parameters for major solar system bodies
    pck00011(),                 # physical properties of major solar system bodies
)

earth = KernelBody("earth")
```

We can now call the `earth` variable like a function of time, and get back the
positions (and velocities) interpolated by `CSPICE` from the data in the kernel
pool.

```@repl quickstart
using Dates

timepoints = [DateTime(year, month, 1) for year in 1950:2049, month in 1:12]

states = earth.(timepoints)
```

Finally, let's plot the data we just collected. This is why we need leap days!

```@repl quickstart
using Plots

figure = let x = [u[begin] for u in states], y = [u[begin+1] for u in states]
    scatter(
        x, y;
        label=nothing, color=:black, xlabel="X (KM)", ylabel="Y (KM)",
        title="Earth's Position w.r.t. the Solar System Barycenter"
    )
end;
```

```@example quickstart
figure # hide
```
