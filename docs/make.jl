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
function package(name; path = name)
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, name),
        path = path,
        name = name,
        giturl = "https://github.com/cadojo/$name.jl.git",
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
        [package("SPICEKernels"), package("SPICEApplications"), package("SPICEBodies")],
    ),
    MultiDocumenter.DropdownNav(
        "HORIZONS",
        [package("HorizonsAPI"), package("HorizonsEphemeris")],
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

using Quarto
@info "Rendering paper with Quarto: $(Quarto.path())"
Quarto.render(joinpath(@__DIR__, "..", "paper"))
Base.cp(joinpath(@__DIR__, "..", "paper", "_manuscript"), joinpath(outpath, "paper"))

Documenter.deploydocs(
    target = outpath,
    repo = "github.com/cadojo/ephemeris.loopy.codes.git",
    branch = "gh-pages",
    versions = nothing,
    cname = "ephemeris.loopy.codes",
)
