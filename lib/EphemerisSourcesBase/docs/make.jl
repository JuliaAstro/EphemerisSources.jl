using Documenter
using EphemerisSourcesBase

makedocs(
    sitename = "EphemerisSourcesBase",
    format = Documenter.HTML(),
    modules = [EphemerisSourcesBase],
    pages = ["Overview" => "index.md", "Reference" => "reference/index.md"],
)

deploydocs(
    target = "build",
    branch = "ephemeris-sources-base",
    repo = "github.com/cadojo/EphemerisSources.jl",
    devbranch = "main",
    tag_prefix = "EphemerisSourcesBase-",
    versions = [
        "stable" => "EphemerisSourcesBase-v^",
        "EphemerisSourcesBase-v#.#",
        "EphemerisSourcesBase-v#.#.#",
    ],
)
