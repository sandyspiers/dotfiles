alias jl = julia -q --project --threads auto
alias j = jl
alias jlq = jl --startup-file=no

# Generate a new package in ./<name>
def jlg [name: string] {
    let cmd = $"using Pkg; Pkg.generate\(\"($name)\"\)"
    julia -e $cmd
}

# test a package
def jlt [] {
    let cmd = "using Pkg; Pkg.test\(\)"
    julia -q --project --threads auto -e $cmd
}
