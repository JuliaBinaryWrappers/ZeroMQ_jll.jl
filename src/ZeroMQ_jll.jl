module ZeroMQ_jll
using Pkg, Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl
import Base: UUID

# We put these inter-JLL-package API values here so that they are always defined, even if there
# is no underlying wrapper held within this JLL package.
const PATH_list = String[]
const LIBPATH_list = String[]

# Load Artifacts.toml file
artifacts_toml = joinpath(@__DIR__, "..", "Artifacts.toml")

# Extract all platforms
artifacts = Pkg.Artifacts.load_artifacts_toml(artifacts_toml; pkg_uuid=UUID("8f1865be-045e-5c20-9c9f-bfbfb0764568"))
platforms = [Pkg.Artifacts.unpack_platform(e, "ZeroMQ", artifacts_toml) for e in artifacts["ZeroMQ"]]

# Filter platforms based on what wrappers we've generated on-disk
platforms = filter(p -> isfile(joinpath(@__DIR__, "wrappers", triplet(p) * ".jl")), platforms)

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Silently fail if there's no binaries for this platform
if best_platform === nothing
    @debug("Unable to load ZeroMQ; unsupported platform $(triplet(platform_key_abi()))")
else
    # Load the appropriate wrapper
    include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))
end

end  # module ZeroMQ_jll
