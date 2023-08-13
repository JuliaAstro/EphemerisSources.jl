using Documenter
using SPICEBodies

makedocs(
    sitename="SPICEBodies",
    format=Documenter.HTML(),
    modules=[SPICEBodies]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/SPICEBodies.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
