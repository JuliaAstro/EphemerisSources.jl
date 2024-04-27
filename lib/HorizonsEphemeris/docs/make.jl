using Documenter, HorizonsEphemeris

makedocs(
    sitename = "HorizonsEphemeris",
    format = Documenter.HTML(),
    modules = [HorizonsEphemeris],
    pages = [
        "Overview" => "index.md",
        "Examples" => "examples/index.md",
        "Reference" => "reference/index.md",
    ],
)

deploydocs(
    target = "build",
    branch = "horizons-ephemeris",
    repo = "github.com/cadojo/EphemerisSources",
    devbranch = "main",
    versions = [
        "stable" => "HorizonsEphemeris-v^",
        "HorizonsEphemeris-v#.#",
        "HorizonsEphemeris-v#.#.#",
    ],
)