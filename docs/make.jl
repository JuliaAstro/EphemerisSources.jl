using Documenter

makedocs(
    sitename = "ephemeris.loopy.codes",
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md",
        "Overview" => [
            "Getting Started" => "getting-started/index.md",
            "Examples" => "examples/index.md"
        ]
    ]
)

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
    ref("HorizonsAPI"),
    ref("HorizonsEphemeris")
]
spice = [
    ref("SPICEKernels"),
    ref("SPICEBodies")
]

docs = [
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build"), # if docs build this is the default 
        path = "overview", # where to put that in the final out folder
        name = "Home", # menu entry
        fix_canonical_url = false # this seems to fix the error from above, but since it is not documented I do not know what it does.
    ),
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

Documenter.deploydocs(
    target = outpath,
    repo = "github.com/cadojo/ephemeris.loopy.codes.git",
    branch = "gh-pages",
    versions = ["" => "."]
)
