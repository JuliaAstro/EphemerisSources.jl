#
# Abstract and concrete types, and methods, for SPICE kernels
#


"""
A supertype for all SPICE Kernels! To satisfy the `SPICEKernel` interface, your new type
must implement each of the methods below.

- `SPICEKernels.type(kernel)::AbstractString`
- `SPICEKernels.path(kernel)::AbstractString`
"""
abstract type SPICEKernel end


function (kernel::SPICEKernel)(; ignorecache=false, directory=SPICE_KERNEL_DIR)
    return fetchkernel(path(kernel); ignorecache=ignorecache, directory=directory)
end

"""
Return the underlying SPICE kernel type.
"""
function type end

"""
Return the path to the kernel. This can be a URL!
"""
function path end

"""
A supertype representing Digital Shape Kernels (DSK).
"""
abstract type DigitalShapeKernel <: SPICEKernel end

"""
A supertype representing Frames Kernels (FK).
"""
abstract type FramesKernel <: SPICEKernel end

"""
A supertype representing Leapseconds Kernels (LSK).
"""
abstract type LeapSecondsKernel <: SPICEKernel end

"""
A supertype representing Planetary Constants Kernels (PCK).
"""
abstract type PlanetaryConstantsKernel <: SPICEKernel end

"""
A supertype representing Spacecraft and Planet Kernels, also known as ephemeris kernels (SPK).
"""
abstract type EphemerisKernel <: SPICEKernel end


const SPICE_EXTENSIONS = Base.ImmutableDict(
    ".bsp" => EphemerisKernel,
    ".dsk" => DigitalShapeKernel,
    ".pck" => PlanetaryConstantsKernel,
    ".bds" => DigitalShapeKernel,
    ".tf" => FramesKernel,
    ".tpc" => PlanetaryConstantsKernel,
    ".bpc" => PlanetaryConstantsKernel,
    ".tls" => LeapSecondsKernel,
    ".pc" => LeapSecondsKernel,
)

"""
Fallback method to inspect the file extension of the provided kernel, and 
return the expected kernel type. If the file extension is not recognized, 
a `KeyError` is thrown.
"""
function type(kernel::Union{<:SPICEKernel, <:AbstractString})
    if kernel isa SPICEKernel
        name = basename(path(kernel))
    else
        name = basename(kernel)
    end

    ext = last(splitext(name))

    return SPICE_EXTENSIONS[ext]
end

"""
A planetary & spacecraft ephemeris kernel.
"""
struct SPK <: EphemerisKernel 
    source::String
    SPK(source::AbstractString) = new(convert(String, source))
end
type(::SPK) = EphemerisKernel
path(kernel::SPK) = kernel.source

"""
A digital shape kernel.
"""
struct DSK <: DigitalShapeKernel
    source::String
    DSK(source::AbstractString) = new(convert(String, source))
end
type(::DSK) = DigitalShapeKernel
path(kernel::DSK) = kernel.source

"""
A planetary constants kernel.
"""
struct PCK <: PlanetaryConstantsKernel
    source::String
    PCK(source::AbstractString) = new(convert(String, source))
end
type(::PCK) = PlanetaryConstantsKernel
path(kernel::PCK) = kernel.source

"""
A coordinate frames kernel.
"""
struct FK <: FramesKernel
    source::String
    FK(source::AbstractString) = new(convert(String, source))
end
type(::FK) = FramesKernel
path(kernel::FK) = kernel.source

"""
A leapseconds kernel.
"""
struct LSK <: LeapSecondsKernel
    source::String
    LSK(source::AbstractString) = new(convert(String, source))
end
type(::LSK) = LeapSecondsKernel
path(kernel::LSK) = kernel.source