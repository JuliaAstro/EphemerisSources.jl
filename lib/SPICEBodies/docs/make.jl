using Documenter
using SPICEBodies

makedocs(sitename = "SPICEBodies", format = Documenter.HTML(), modules = [SPICEBodies],
         pages = ["Overview" => "index.md", "Reference" => "reference/index.md"])

deploydocs(target = "build", branch = "spice-bodies",
           repo = "github.com/JuliaAstro/EphemerisSources.jl", devbranch = "main",
           tag_prefix = "SPICEBodies-")
