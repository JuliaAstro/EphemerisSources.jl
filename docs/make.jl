using Latexify
using Documenter
using ModelingToolkit
using AstrodynamicalModels

makedocs(
    sitename="`ephemeris.loopy.codes`",
    format=Documenter.HTML(),
    modules=[],
    pages=[
        "Home" => "index.md",
        "Overview" => [
            "Getting Started" => "getting-started/index.md",
            "Examples" => "examples/index.md",
        ],
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/ephemeris.loopy.codes.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
