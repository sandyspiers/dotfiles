try
    import REPL
    REPL.GlobalOptions.auto_indent = false
    REPL.LineEdit.options(::REPL.LineEdit.PromptState) = REPL.GlobalOptions
catch e
    println("Could not turn off auto-indenting!")
end

try
    import OhMyREPL
    OhMyREPL.enable_autocomplete_brackets(false)
catch e
    println("Could not import OhMyREPL!")
end

try
    using Revise
catch e
    println("Could not import Revise!")
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

function include_tests()
    if isdir("test")
        orig_skip_test = get(ENV, "SKIP_TEST", "false")
        ENV["SKIP_TEST"] = "true"
        println("includet(")
        for f in readdir("test"; join=true)
            if startswith(basename(f), "test") && endswith(basename(f), ".jl")
                println("...$(basename(f))")
                includet(f)
            end
        end
        ENV["SKIP_TEST"] = orig_skip_test
        println(")")
    else
        println("No test/ dir found.")
    end
end
