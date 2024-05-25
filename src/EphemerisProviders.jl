module EphemerisProviders

using Dates
using Reexport
using AstroTime
using RequiredInterfaces
using HorizonsEphemeris, SPICEBodies

abstract type EphemerisProvider end

function ephemeris end

const BodyLike = Union{<:AbstractString,<:Integer}
const EpochLike = Union{<:AbstractString,<:Dates.AbstractDateTime}


@required EphemerisProvider begin
    ephemeris(
        ::BodyLike,
        ::Union{<:EpochLike,<:AbstractVector{<:EpochLike}};
        provider::EphemerisProvider,
        wrt::BodyLike = "ssb",
    )::NamedTuple{:t,:x,:y,:z,:ẋ,:ẏ,:ż}
end

struct HorizonsRequest <: EphemerisProvider end
struct SPICEKernel <: EphemerisProvider end

function ephemeris(
    body::BodyLike,
    time::Union{<:EpochLike,<:AbstractVector{<:EpochLike}};
    provider::HorizonsRequest = HorizonsRequest(),
    wrt::BodyLike = "ssb",
)
    data = HorizonsRequestEphemeris.ephemeris(body, time; wrt = wrt, units = "KM-S")
    return (;
        t = QuantityArray(data.t, us"d"),
        x = QuantityArray(data.x, u"km"),
        y = QuantityArray(data.y, u"km"),
        z = QuantityArray(data.z, u"km"),
        ẋ = QuantityArray(data.ẋ, u"km/s"),
        ẏ = QuantityArray(data.ẏ, u"km/s"),
        ż = QuantityArray(data.ż, u"km/s"),
    )
end

function ephemeris(
    body::BodyLike,
    time::Union{<:EpochLike,<:AbstractVector{<:EpochLike}};
    provider::SPICEKernel = SPICEKernel(),
    wrt::BodyLike = "ssb",
)

    data = HorizonsRequestEphemeris.ephemeris(body, time; wrt = wrt, units = "KM-S")
    return (;
        t = QuantityArray(data.t, us"d"),
        x = QuantityArray(data.x, u"km"),
        y = QuantityArray(data.y, u"km"),
        z = QuantityArray(data.z, u"km"),
        ẋ = QuantityArray(data.ẋ, u"km/s"),
        ẏ = QuantityArray(data.ẏ, u"km/s"),
        ż = QuantityArray(data.ż, u"km/s"),
    )
end

end