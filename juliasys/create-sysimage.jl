using PackageCompiler: create_sysimage
using TestEnv # Required for some meta-programming magic

# main entry
(@main)(args) = _csys(args)

# populate julia script to run tests for the given modules
function _get_test_string(modules)::String
    mod_list = replace("$modules", r"\"|\[|\]" => "")
    return """
    using Pkg, TestEnv
    using $mod_list
    for mod in [$mod_list]
        _mod = pkgdir(mod)
        Pkg.activate(_mod)
        TestEnv.activate()
        Pkg.instantiate()
        include(joinpath(_mod, "test", "runtests.jl"))
        Pkg.activate()
    end
    """
end

# create sys image
function _csys(args)
    if length(args) < 2
        @warn "Please provide name and modules!"
        return 1
    end
    name = args[1]
    name_short = split(name, ".")[1]
    modules = args[2:end]
    precomp_file = "_$(name_short)_precompile_statements.jl"
    @info "Creating a sysimage named $name with modules $modules..."

    @info "Looking for precompile file $(precomp_file)"
    if !isfile(precomp_file)
        @info "No precompilation file found, running unit tests..."
        @info "Running test set and saving precompile"
        try
            run(`julia --startup-file=no --trace-compile=$precomp_file -e $(_get_test_string(modules))`)
        catch e
            @warn "Some test have failed! We will continue to try make sys image, but please check the output from unit tests to confirm suitability."
        end
    else
        @info "Found a precompile file, reusing it!"
    end

    @info "Compiling sysimage..."
    create_sysimage(modules, sysimage_path=name, precompile_statements_file=precomp_file)

    @info "Done!"
    return 0
end
