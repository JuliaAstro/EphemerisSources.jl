using Documenter

makedocs(
    sitename = "juliaastro.github.io/docs/EphemerisSources.jl",
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
        giturl = "https://github.com/JuliaAstro/EphemerisSources.jl.git",
        fix_canonical_url = false,
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
    brand_image = MultiDocumenter.BrandImage(
        "https://loopy.codes",
        "https://loopy.codes/images/orbits.png",
    ),
)

run(Cmd(`quarto render`, dir = joinpath(@__DIR__, "..", "paper")))
Base.cp(
    joinpath(@__DIR__, "..", "paper", "_manuscript", "paper"),
    joinpath(outpath, "paper");
    follow_symlinks = true,
)

Documenter.deploydocs(
    target = outpath,
    repo = "github.com/JuliaAstro/EphemerisSources.jl.git",
    branch = "gh-pages",
    versions = nothing,
    cname = "juliaastro.github.io/docs/EphemerisSources.jl",
)
