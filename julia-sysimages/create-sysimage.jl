using PackageCompiler

PackageCompiler.create_sysimage(
    ["OhMyREPL", "Revise"],
    sysimage_path="base.so",
    precompile_statements_file="base-precompile.jl"
)

PackageCompiler.create_sysimage(
    ["LanguageServer", "SymbolServer"],
    sysimage_path="lsp.so",
    precompile_statements_file="lsp-precompile.jl"
)
