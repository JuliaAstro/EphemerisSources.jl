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
    repo = "github.com/JuliaAstro/EphemerisSources.jl",
    devbranch = "main",
    tag_prefix = "SPICEKernels-",
)
