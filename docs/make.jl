using Documenter

makedocs(
    sitename = "ephemeris.loopy.codes",
    format = Documenter.HTML(),
    pages = [
        "Overview" => [
            "About Ephemeris" => "index.md",
            "Quick Start" => [
                "SPICE" => "examples/spice/index.md",
                "HORIZONS" => "examples/horizons/index.md",
            ],
        ],
    ],
)

using MultiDocumenter

clonedir = mktempdir()
function package(name; path = joinpath("lib", name), branch)
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, name),
        path = path,
        name = name,
        branch = branch,
        giturl = "https://github.com/cadojo/EphemerisSources.jl.git",
    )
end

function docs(name; path = name, root = "")
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(@__DIR__, "build", root),
        path = path,
        name = name,
        fix_canonical_url = false,
    )
end

content = [
    docs("Overview"; path = "docs"),
    MultiDocumenter.DropdownNav(
        "SPICE",
        [
            package("SPICEKernels"; branch = "spice-kernels"),
            package("SPICEBodies"; branch = "spice-bodies"),
        ],
    ),
    MultiDocumenter.DropdownNav(
        "HORIZONS",
        [
            package("HorizonsAPI"; branch = "horizons-api"),
            package("HorizonsEphemeris"; branch = "horizons-ephemeris"),
        ],
    ),
]

outpath = joinpath(@__DIR__, "build")

MultiDocumenter.make(
    outpath,
    content;
    rootpath = outpath,
    prettyurls = true,
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable", "dev"],
        engine = MultiDocumenter.FlexSearch,
    ),
    # brand_image = MultiDocumenter.BrandImage(
    #     "https://loopy.codes",
    #     "https://loopy.codes/blog/posts/modeling-with-ephemeris/ephemeris.png",
    # ),
)

Base.mv(joinpath(@__DIR__, "..", "paper", "_manuscript"), joinpath(outpath, "paper"))

Documenter.deploydocs(
    target = outpath,
    repo = "github.com/cadojo/ephemeris.loopy.codes.git",
    branch = "gh-pages",
    versions = nothing,
    cname = "ephemeris.loopy.codes",
)
