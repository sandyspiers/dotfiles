try
    import Pkg
    if isfile("Project.toml") && isfile("Manifest.toml")
        Pkg.activate(".")
    end
catch e
    println("Could not import Pkg!")
end

try
    import Revise
catch e
    println("Could not import Revise!")
end

try
    import OhMyREPL
catch e
    println("Could not import OhMyREPL!")
end

try
    import AbbreviatedStackTraces
catch e
    println("Could not import AbbreviatedStackTraces!")
end

function GetTestEnv()
    @eval begin
        import TestEnv
        TestEnv.activate()
    end
end

function GetPkgTemplate()
    @eval begin
        using PkgTemplates
        Template(
            ["sandyspiers <sandy.spiers@curtin.edu.au> and contributors"],
            ".",
            "github.com",
            v"1.6.7",
            PkgTemplates.Plugin[
                BlueStyleBadge(),
                CompatHelper(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/github/workflows/CompatHelper.yml",
                    "CompatHelper.yml",
                    "0 0 * * *",
                ),
                Dependabot(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/github/dependabot.yml",
                ),
                Formatter(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/.JuliaFormatter.toml",
                    "blue",
                ),
                Git(String[], nothing, nothing, "main", false, true, false, false),
                GitHubActions(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/github/workflows/CI.yml",
                    "CI.yml",
                    true,
                    false,
                    false,
                    true,
                    false,
                    true,
                    ["1.6", "1.10", "pre"],
                ),
                License(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/licenses/MIT",
                    "LICENSE",
                ),
                ProjectFile(v"1.0.0-DEV"),
                Readme(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/README.md",
                    "README.md",
                    false,
                    DataType[
                        Documenter{GitHubActions},
                        Documenter{GitLabCI},
                        Documenter{TravisCI},
                        GitHubActions,
                        GitLabCI,
                        TravisCI,
                        AppVeyor,
                        DroneCI,
                        CirrusCI,
                        Codecov,
                        Coveralls,
                        BlueStyleBadge,
                        ColPracBadge,
                        PkgEvalBadge,
                    ],
                    DataType[],
                ),
                SrcDir(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/src/module.jl",
                    "",
                ),
                TagBot(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/github/workflows/TagBot.yml",
                    "TagBot.yml",
                    "JuliaTagBot",
                    Secret("GITHUB_TOKEN"),
                    Secret("DOCUMENTER_KEY"),
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                    nothing,
                ),
                Tests(
                    ENV["HOME"] * "/.julia/packages/PkgTemplates/Jj2F7/templates/test/runtests.jl",
                    false,
                    true,
                    NamedTuple(),
                    false,
                ),
                Codecov()
            ],
            "sandyspiers",
        )
    end
end

