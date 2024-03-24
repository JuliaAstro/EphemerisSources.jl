
using MultiDocumenter:
    DropdownNav,
    MultiDocRef,
    MegaDropdownNav,
    Column,
    make,
    SearchConfig,
    FlexSearch

clonedir = mktempdir()

ref(name) = MultiDocRef(
    upstream=joinpath(clonedir, name),
    path=name,
    name=name,
    giturl="https://github.com/cadojo/$name.jl.git",
)

horizons = [
    ref("HorizonsAPI")
]
spice = [
    ref("SPICEKernels")
]

docs = [
    # MultiDocRef(
    #     upstream=joinpath(clonedir, "Home"),
    #     path="Overview",
    #     name="Home",
    #     giturl="https://github.com/cadojo/ephemeris.loopy.codes.git"
    # ),
    MegaDropdownNav(
        "Ephemeris Sources", [
            Column("JPL HORIZONS", horizons),
            Column("JPL SPICE Kernels", spice),
        ]
    )
]

outpath = joinpath(@__DIR__, "build")

make(
    outpath,
    docs;
    search_engine=SearchConfig(
        index_versions=["stable", "dev"],
        engine=FlexSearch
    )
)