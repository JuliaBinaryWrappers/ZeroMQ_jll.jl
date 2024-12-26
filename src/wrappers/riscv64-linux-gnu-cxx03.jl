# Autogenerated wrapper script for ZeroMQ_jll for riscv64-linux-gnu-cxx03
export libzmq

using libsodium_jll
JLLWrappers.@generate_wrapper_header("ZeroMQ")
JLLWrappers.@declare_library_product(libzmq, "libzmq.so.5")
function __init__()
    JLLWrappers.@generate_init_header(libsodium_jll)
    JLLWrappers.@init_library_product(
        libzmq,
        "lib/libzmq.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
