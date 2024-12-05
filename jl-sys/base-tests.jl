using Pkg
using TestEnv
using OhMyREPL
using Revise

for mod in [OhMyREPL, Revise]
    _mod = pkgdir(mod)
    Pkg.activate(_mod)
    TestEnv.activate()
    Pkg.instantiate()
    include(joinpath(_mod, "test", "runtests.jl"))
    Pkg.activate()
end
