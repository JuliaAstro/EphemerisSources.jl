using Documenter, SPICEKernels

makedocs(
    sitename = "SPICEKernels",
    format = Documenter.HTML(size_threshold = nothing),
    modules = [SPICEKernels],
    pages = ["Overview" => "index.md", "Reference" => "reference/index.md"],
)

deploydocs(
    target = "build",
    branch = "spice-kernels",
    repo = "github.com/cadojo/EphemerisSources.jl",
    devbranch = "main",
    versions = ["stable" => "SPICEKernels-v^", "SPICEKernels-v#.#", "SPICEKernels-v#.#.#"],
)