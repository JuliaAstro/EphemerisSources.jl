"""
Ephemeris via SPICE kernels.

# Extended Help

## Imports

$(IMPORTS)

## Exports

$(EXPORTS)
"""
module SPICEBodies

export 
    KernelBody,
    pos,
    vel,
    gm,
    radii

import Dates
using AstroTime
using SPICE
using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)
                                         $(DOCSTRING)
                                         """

@template (TYPES, CONSTANTS) = """
                               $(TYPEDEF)
                               $(DOCSTRING)
                               """


"""
A supertype for all SPICE ephemeris objects.

## Interface

All subtypes must implement the following method.

1. `SPICEBodies.naifcode(body)::Int`

The type then has access to the following method implementations.

1. body(epoch, ...)     # full state vector (KM, KM/S)
2. pos(body, ...)       # position vector (KM)
3. vel(body, ...)       # velocity vector (KM/S) 
4. gm(body)             # "GM" mass parameter (KM^3/S^2)
4. radii(body)          # radii vector (KM)

"""
abstract type AbstractKernelBody end

"""
Given an ephemeris body, a NAIF ID code, or a body name, return the corresponding NAIF ID.
"""
function naifcode end

"""
Any celestial body, spacecraft, barycenter, or other ephemeris object which has an 
assigned NAIF ID within the local SPICE kernel pool.
"""
struct KernelBody <: AbstractKernelBody 
    """
    Corresponding NAIF ID.
    """
    id::Int

    KernelBody(id::Integer) = new(Int(id))
    KernelBody(name::Union{<:AbstractString, Symbol}) = new(naifcode(name))
end

"""
A union type for all `SPICEBodies.naifcode` argument types.
"""
const BodyLike = Union{AbstractKernelBody, Integer, AbstractString, Symbol}

"""
Return the number of seconds since J2000.
"""
function j2000s end

j2000s(epoch::Epoch) = AstroTime.j2000(epoch) |> seconds |> value
j2000s(datetime::Dates.AbstractDateTime) = Dates.value(Dates.Millisecond(datetime - Dates.DateTime(AstroTime.J2000_EPOCH))) / 1000

naifcode(body::KernelBody) = body.id
naifcode(id::Integer) = id

function naifcode(name::Union{<:AbstractString, Symbol})
    id = bodn2c(name)

    if !isnothing(id)
        return id
    else
        error("The name $name could not be found in any currently loaded SPICE kernels.")
    end
end

"""
Given an epoch, return the full state vector (KM,KM/s) of the body relative to the 
observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function (body::BodyLike)(epoch::Dates.AbstractDateTime; frame="J2000", aberration="none", wrt=0) 
    et = j2000s(epoch)

    starg, lt = spkez(naifcode(body), et, frame, aberration, naifcode(wrt))
    return starg
end

"""
Given the number of seconds past J2000, return the full state vector (KM,KM/s) relative to 
the observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function (body::BodyLike)(j2000s::Real; frame="J2000", aberration="none", wrt=0)
    starg, lt = spkez(naifcode(body), j2000s, frame, aberration, naifcode(wrt))
    return starg
end

"""
Given an epoch, return the position vector (KM) of the body relative to the 
observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function pos(body::BodyLike, epoch::Epoch; frame="J2000", aberration="none", wrt=0) 
    et = j2000s(epoch)
    starg, lt = spkezp(naifcode(body), et, frame, aberration, naifcode(wrt))
    return starg
end

"""
Given the number of seconds past J2000, return the position vector (KM) relative to 
the observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function pos(body::BodyLike, j2000s::Real; frame="J2000", aberration="none", wrt=0) 
    starg, lt = spkezp(naifcode(body), j2000s, frame, aberration, naifcode(wrt))
    return starg
end

"""
Given an epoch, return the velocity vector (KM/S) of the body relative to the 
observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function vel(body::BodyLike, epoch::Epoch; frame="J2000", aberration="none", wrt=0) 
    et = j2000s(epoch)

    starg, lt = spkez(naifcode(body), et, frame, aberration, naifcode(wrt))
    x, y, z, ẋ, ẏ, ż = starg
    return [ẋ, ẏ, ż]
end

"""
Given the number of seconds past J2000, return the velocity vector (KM/S) relative to 
the observer defined by `wrt`. See `spkez` for more information about the underlying 
implementation.
"""
function vel(body::BodyLike, j2000s::Real; frame="J2000", aberration="none", wrt=0) 
    starg, lt = spkez(naifcode(body), j2000s, frame, aberration, naifcode(wrt))
    x, y, z, ẋ, ẏ, ż = starg
    return [ẋ, ẏ, ż]
end

"""
Return the mass parameter of the body (KM^3/S^2).
"""
function gm(body::BodyLike)
    μ, = bodvcd(naifcode(body), "GM", 1)
    return μ
end

"""
Return the radii vector of the body (KM).
"""
function radii(body::BodyLike)
    R = bodvcd(naifcode(body), "RADII", 3)
    return R
end 

end # module SPICEBodies
