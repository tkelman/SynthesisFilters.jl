# resolve dependencies with non-officlal packages

function install_non_official_pkg(path; build::Bool=false)
    name = basename(splitext(path)[1])
    try
        Pkg.installed(name)
    catch
        Pkg.clone(path)
        if build
            Pkg.build(name)
        end
    end
end

install_non_official_pkg("https://github.com/r9y9/MelGeneralizedCepstrums.jl",
                         build=true)
