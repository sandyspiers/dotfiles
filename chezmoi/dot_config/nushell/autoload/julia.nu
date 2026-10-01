alias jl = julia -q --project --threads auto
alias jlq = jl --startup-file=no

# Generate a new package in ./<name>
def jlg [name: string] {
    let cmd = $"using Pkg; Pkg.generate\(\"($name)\"\)"
    julia -e $cmd
}
