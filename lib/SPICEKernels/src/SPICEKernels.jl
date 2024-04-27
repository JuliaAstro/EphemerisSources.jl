"""
Download any and all Generic Kernels provided by NASA JPL!

!!! warning
    This package is not affiliated with or endorsed by NASA, JPL, or any
    other organization! This is an independently written package by an
    astrodynamics hobbyist.

# Extended Help

## Imports

$(IMPORTS)

## Exports

$(EXPORTS)

"""
module SPICEKernels

using DocStringExtensions
include("docstrings.jl")

using HTTP
using Dates
using Scratch
using Downloads

export 
    DSK,
    PCK,
    SPK,
    LSK,
    FK,
    kernel,
    fetchkernel

"""
The directory where all SPICE kernels are cached, by default.
"""
SPICE_KERNEL_DIR = ""

"""
The URL of NASA's generic kernel HTTP server.
"""
const GENERIC_KERNEL_URL = "https://naif.jpl.nasa.gov/pub/naif/generic_kernels"

function __init__()
    global SPICE_KERNEL_DIR = @get_scratch!("kernels")
end

include(joinpath("gen", "map.jl"))

"""
Given the ephemeris file name, download the file to the `SPICEKernels.jl` scratch space, 
and return a path to the file location. If a full URL or path is provided, that path will 
be used. Otherwise, the `kernel` is assumed to be a SPICE Generic Kernel. 

# Extended Help

If `ignorecache` is is enabled, the ephemeris file will be re-downloaded even if it exists already 
in the `SPICEKernels.jl` scratch space. If `directory` is set to something other than the 
`SPICEKernels.SPICE_KERNEL_DIR` variable, the file is downloaded to the provided directory 
instead of the `SPICEKernels.jl` scratch space. 
"""
function fetchkernel(
        kernel::AbstractString;
        directory::AbstractString = SPICE_KERNEL_DIR,
        ignorecache::Bool = false
    )

    global SPICE_KERNEL_DIR
    local kernelpath

    try
        kernelpath = GENERIC_KERNELS[kernel]
    catch e
        if e isa KeyError
            kernelpath = kernel
        else
            rethrow(e)
        end
    end

    Base.mkpath(directory)
    cachename = joinpath(SPICE_KERNEL_DIR, basename(kernelpath))
    filename = joinpath(directory, basename(kernelpath))

    if !ignorecache && isfile(filename)
        @debug "File $filename already exists."
        return filename
    elseif isfile(kernelpath) # if local
        @debug "Copying $kernelpath to $filename"
        Base.cp(kernelpath, filename; follow_symlinks=true, force=false)
    elseif !ignorecache && isfile(cachename) # if already cached
        @debug "Copying $cachename to $filename"
        Base.cp(cachename, filename; follow_symlinks=true, force=false)
    else # if download necessary
        @debug "Downloading $kernelpath to $filename"
        Downloads.download(kernelpath, filename)
    end
    
    return filename
end

include("types.jl")
include("gen/kernels.jl")

"""
Construct a `SPICEKernel` instance, with the type informed by the provided file's extension.
"""
function kernel(path::AbstractString)
    kerneltypes = Base.ImmutableDict(
        DigitalShapeKernel => DSK,
        EphemerisKernel => SPK,
        FramesKernel => FK,
        LeapSecondsKernel => LSK,
        PlanetaryConstantsKernel => PCK,
    )

    _, ext = splitext(path)

    return kerneltypes[SPICE_EXTENSIONS[ext]](path)
end

end # module SPICEKernels
