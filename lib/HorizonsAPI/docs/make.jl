using Documenter
using HorizonsAPI

makedocs(
    sitename = "HorizonsAPI",
    format = Documenter.HTML(),
    modules = [HorizonsAPI],
    pages = [
        "Overview" => "index.md",
        "Examples" => "examples/index.md",
        "Reference" => "reference/index.md",
    ],
)

deploydocs(
    target = "build",
    repo = "github.com/cadojo/EphemerisSources.jl",
    branch = "horizons-api",
    devbranch = "main",
    tag_prefix = "HorizonsAPI-",
    versions = ["stable" => "HorizonsAPI-v^", "HorizonsAPI-v#.#", "HorizonsAPI-v#.#.#"],
)