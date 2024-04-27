using Documenter, SPICEKernels

makedocs(
    sitename="SPICEKernels",
    format=Documenter.HTML(size_threshold=nothing),
    modules=[SPICEKernels],
    pages=[
        "Overview" => "index.md",
        "Reference" => "reference/index.md",
    ]
)

deploydocs(
    target="build",
    repo="github.com/cadojo/SPICEKernels.jl.git",
    branch="gh-pages",
    devbranch="main",
    versions=["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
