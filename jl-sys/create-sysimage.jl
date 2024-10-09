using PackageCompiler
PackageCompiler.create_sysimage(["OhMyREPL", "Revise"], sysimage_path="base.so", precompile_statements_file="base-precompile.jl")
