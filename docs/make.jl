using Documenter, HorizonsEphemeris

makedocs(
    sitename="HorizonsEphemeris",
    format=Documenter.HTML(),
    modules=[HorizonsEphemeris]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/HorizonsEphemeris.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
