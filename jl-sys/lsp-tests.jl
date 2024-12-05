using Pkg
using TestEnv
using LanguageServer
using SymbolServer

withenv("CI" => true) do
    for mod in [LanguageServer, SymbolServer]
        current_project = pwd()
        _mod = pkgdir(mod)
        Pkg.activate(_mod)
        TestEnv.activate()
        include(joinpath(_mod, "test", "runtests.jl"))
        Pkg.activate(current_project)
    end
end
