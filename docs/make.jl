using Documenter
using SPICEEphemeris

makedocs(
    sitename="SPICEEphemeris",
    format=Documenter.HTML(),
    modules=[SPICEEphemeris]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/SPICEEphemeris.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
