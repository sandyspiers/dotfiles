try
    import Pkg
    if isfile("Project.toml") && isfile("Manifest.toml")
        Pkg.activate(".")
    end
catch e
    println("Could not import Pkg!")
end

try
    import Revise
catch e
    println("Could not import Revise!")
end

try
    import OhMyREPL
    OhMyREPL.enable_autocomplete_brackets(false)
catch e
    println("Could not import OhMyREPL!")
end

try
    using Infiltrator: @infiltrate
catch e
    println("Could not import Infiltrator!")
end

function GetTestEnv()
    @eval begin
        import TestEnv
        TestEnv.activate()
    end
end

function GetPkgTemplate()
    @eval begin
        using PkgTemplates
        Template(
            ["sandyspiers <sandy.spiers@curtin.edu.au> and contributors"],
            ".",
            "github.com",
            v"1.10.7",
            PkgTemplates.Plugin[
                ProjectFile(v"0.1.0-DEV"),
                SrcDir(),
                Tests(),
                Readme(),
                License(),
                Git(),
                GitHubActions(),
                CompatHelper(),
                Codecov(),
                BlueStyleBadge(),
                Formatter(; style="blue"),
            ],
            "sandyspiers",
        )
    end
end

