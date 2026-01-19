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

try
    using TestPicker
catch e
    println("Could not import TestPicker!")
end

