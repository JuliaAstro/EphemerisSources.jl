[![Tests](https://github.com/cadojo/SPICEKernels.jl/workflows/Tests/badge.svg)](https://github.com/cadojo/SPICEKernels.jl/actions?query=workflow%3ATests)
[![Docs](https://github.com/cadojo/SPICEKernels.jl/workflows/Documentation/badge.svg)](https://cadojo.github.io/SPICEKernels.jl)
[![SciML Code Style](https://img.shields.io/static/v1?label=Style&message=SciML&color=9668e2&labelColor=3E474F)](https://github.com/SciML/SciMLStyle)

# `SPICEKernels.jl`

_All General Kernels provided by NASA!_

> **Warning**
>
> This package is not affiliated with or endorsed by NASA, JPL, Caltech, or any
> other organization! This is an independently written package by an
> astrodynamics hobbyist.

## Installation

Choose one of the following two lines!

```julia
Pkg.add("SPICEKernels")
```

```julia
]add SPICEKernels # in the Julia REPL
```

## Usage

Inspect and download an ephemeris kernel from within Julia! The major version will not change without package _usage_ changing. New, modified, or removed kernels will increment the _patched_ version of this package. 

```julia
julia> using SPICE, SPICEKernels

julia> furnsh(
           de440s(),                   # position and velocity data for nearby planets
           latest_leapseconds_lsk(),   # timekeeping, parsing epochs
           gm_de440(),                 # mass parameters for major solar system bodies
           pck00011(),                 # physical properties of major solar system bodies
       )

help?> ?jup344
search: jup344 jup344_nameid jup344_s2003_j24 jup344_s2003_j24_nameid jup346 jup346_nameid

  A SPK kernel of size 297.5 MB, linked from https://naif.jpl.nasa.gov [1].
  Calling this variable like a function will return a path to the file, downloading to
  scratchspace if necessary.

  Extended Help
  ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

  This kernel's link was sourced on 2023-09-29.

  References
  ============

  [1] https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup344.bsp

  Description
  =============

   
  BRIEF -- Version 4.1.0, September 17, 2021 -- Toolkit Version N0067
   
   
  Summary for: jup344.bsp
   
  Bodies: EARTH BARYCENTER (3)    AITNE (531)             557
          JUPITER BARYCENTER (5)  EURYDOME (532)          558
          SUN (10)                EUANTHE (533)           559
          EARTH (399)             EUPORIE (534)           560
          HIMALIA (506)           ORTHOSIE (535)          561
          ELARA (507)             SPONDE (536)            562
          PASIPHAE (508)          KALE (537)              563
          SINOPE (509)            PASITHEE (538)          564
          LYSITHEA (510)          HEGEMONE (539)          565
          CARME (511)             MNEME (540)             566
          ANANKE (512)            AOEDE (541)             567
          LEDA (513)              THELXINOE (542)         568
          CALLIRRHOE (517)        ARCHE (543)             569
          THEMISTO (518)          KALLICHORE (544)        570
          MEGACLITE (519)         HELIKE (545)            571
          TAYGETE (520)           CARPO (546)             572
          CHALDENE (521)          EUKELADE (547)          JUPITER (599)
          HARPALYKE (522)         CYLLENE (548)           55501
          KALYKE (523)            KORE (549)              55502
          IOCASTE (524)           HERSE (550)             55503
          ERINOME (525)           551                     55504
          ISONOE (526)            552                     55505
          PRAXIDIKE (527)         DIA (553)               55506
          AUTONOE (528)           554                     55507
          THYONE (529)            555
          HERMIPPE (530)          556
          Start of Interval (ET)              End of Interval (ET)
          -----------------------------       -----------------------------
          1799 DEC 27 00:00:00.000            2200 JAN 05 00:00:00.000
```

## Motivation

_Why this?_

This package allows you to check out what general kernels are available, all
from the Julia REPL / language server! Each kernel is represented by a type,
where the SPICE kernel flavor is encoded in Julia's type system.
Each requested kernel is cached by default, so there's no need 
to download a kernel more than once!
