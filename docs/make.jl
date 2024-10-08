using EphemerisSources, Documenter

makedocs(
    sitename = "EphemerisSources.jl",
    format = Documenter.HTML(size_threshold = nothing),
    modules = [EphemerisSources],
    pages = [
        "Overview" => [
            "About Ephemeris" => "index.md",
            "Quick Start" => [
                "EphemerisSources.jl" => "reference/index.md",
                "SPICE" => "examples/spice/index.md",
                "Horizons" => "examples/horizons/index.md",
                "Study: JWST and Gaia" => "examples/telescope-study/index.md",
                "Study: Orbital Velocties" => "examples/velocity-study/index.md",
            ],
        ],
    ],
)

deploydocs(
    target = "build",
    branch = "ephemeris-sources",
    repo = "github.com/JuliaAstro/EphemerisSources.jl",
    devbranch = "main",
)

using MultiDocumenter

clonedir = mktempdir()
function package(name; path = joinpath("docs", name), branch)
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, name),
        path = path,
        name = name,
        branch = branch,
        giturl = "https://github.com/JuliaAstro/EphemerisSources.jl.git",
        fix_canonical_url = false,
    )
end

content = [
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "EphemerisSources.jl"),
        path = "docs",
        name = "EphemerisSources.jl",
        branch = "ephemeris-sources",
        giturl = "https://github.com/JuliaAstro/EphemerisSources.jl.git",
        fix_canonical_url = false,
    ),
    MultiDocumenter.MultiDocRef(
        upstream = joinpath(clonedir, "pre-print"),
        path = "pre-print",
        name = "Paper",
        branch = "joss-preprint",
        giturl = "https://github.com/JuliaAstro/EphemerisSources.jl.git",
        fix_canonical_url = false,
    ),
    MultiDocumenter.DropdownNav(
        "Interfaces",
        [package("EphemerisSourcesBase"; branch = "ephemeris-sources-base")],
    ),
    MultiDocumenter.DropdownNav(
        "SPICE",
        [
            package("SPICEKernels"; branch = "spice-kernels"),
            package("SPICEBodies"; branch = "spice-bodies"),
        ],
    ),
    MultiDocumenter.DropdownNav(
        "Horizons",
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
    prettyurls = true,
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable", "dev"],
        engine = MultiDocumenter.FlexSearch,
    ),
    brand_image = MultiDocumenter.BrandImage(
        "https://juliaastro.org",
        "http://juliaastro.org/dev/assets/logo.svg",
    ),
)

Documenter.deploydocs(
    target = outpath,
    versions = nothing,
    repo = "github.com/JuliaAstro/EphemerisSources.jl",
)
