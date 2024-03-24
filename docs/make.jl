using MultiDocumenter

clonedir = mktempdir()

function ref(name)
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, name),
        path = name,
        name = name,
        giturl = "https://github.com/cadojo/$name.jl.git"
    )
end

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
    MultiDocumenter.MegaDropdownNav(
    "Ephemeris Sources", [
        MultiDocumenter.Column("JPL HORIZONS", horizons),
        MultiDocumenter.Column("JPL SPICE Kernels", spice)
    ]
)
]

outpath = joinpath(@__DIR__, "build")

MultiDocumenter.make(
    outpath,
    docs;
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable", "dev"],
        engine = MultiDocumenter.FlexSearch
    )
)

using Documenter

makedocs(
    sitename = "`ephemeris.loopy.codes`",
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md",
        "Overview" => [
            "Getting Started" => "getting-started/index.md",
            "Examples" => "examples/index.md"
        ]
    ]
)

Documenter.deploydocs(
    target = outpath,
    repo = "github.com/cadojo/ephemeris.loopy.codes.git",
    branch = "gh-pages"
)
