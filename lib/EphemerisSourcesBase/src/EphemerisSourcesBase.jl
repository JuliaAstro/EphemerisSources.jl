"""
Common types and methods for `EphemerisSources.jl`.

# Extended Help

## Imports

$(IMPORTS)

## Exports

$(EXPORTS)
"""
module EphemerisSourcesBase

using SPICE
using AstroTime

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
An abstract supertype for celestial bodies in ephemeris data.
"""
abstract type CelestialBody end


"""
Given a `CelestialBody`, a NAIF ID code, or a body name, return the corresponding NAIF ID.
"""
naifcode(body::CelestialBody) =
    error("`EphemerisSourcesBase.naifcode` is not implemented for `$(typeof(body))`.")

naifcode(id::Integer) = id

function naifcode(name::Union{<:AbstractString,Symbol})
    id = bodn2c(name)

    if !isnothing(id)
        return id
    else
        error("The name $name could not be found in any currently loaded SPICE kernels.")
    end
end

include("types.jl")


end # module EphemerisSourcesBase
