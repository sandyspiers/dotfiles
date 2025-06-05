try
    import REPL
    REPL.GlobalOptions.auto_indent = false
    REPL.LineEdit.options(s::REPL.LineEdit.PromptState) = REPL.GlobalOptions
catch e
    println("Could not turn off auto-indenting!")
end

try
    import Pkg
    if isfile("Project.toml") && isfile("Manifest.toml")
        Pkg.activate(".")
    end
catch e
    println("Could not import Pkg!")
end

try
    using Revise
catch e
    println("Could not import Revise!")
end
function include_tests()
    if isdir("test")
        println("includet(")
        for f in readdir("test"; join=true)
            if startswith(basename(f), "test") && endswith(basename(f), ".jl")
                println("...$(basename(f))")
                includet(f)
            end
        end
        println(")")
    else
        println("No test/ dir found.")
    end
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

