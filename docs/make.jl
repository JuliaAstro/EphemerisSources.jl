using Documenter, HorizonsEphemeris

makedocs(
    sitename="HorizonsEphemeris",
    format=Documenter.HTML(),
    modules=[HorizonsEphemeris],
    pages=[
        "Overview" => "index.md",
        "Examples" => "examples/index.md",
        "Reference" => "reference/index.md",
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/HorizonsEphemeris.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
