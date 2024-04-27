using Documenter
using SPICEBodies

makedocs(
    sitename = "SPICEBodies",
    format = Documenter.HTML(),
    modules = [SPICEBodies],
    pages = [
        "Overview" => "index.md",
        "Reference" => "reference/index.md"
    ]
)

deploydocs(
    target = "build",
    branch = "spice-bodies",
    devbranch = "main",
    versions = [
        "stable" => "SPICEBodies-v^",
        "SPICEBodies-v#.#",
        "SPICEBodies-v#.#.#"
    ]
)
