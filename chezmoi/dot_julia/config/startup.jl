try
    import OhMyREPL
catch _
    println("Could not import OhMyREPL!")
end

try
    using Revise
catch _
    println("Could not import Revise!")
end

try
    using Infiltrator: @infiltrate
catch _
    println("Could not import Infiltrator!")
end

try
    using TestPicker
catch _
    println("Could not import TestPicker!")
end

