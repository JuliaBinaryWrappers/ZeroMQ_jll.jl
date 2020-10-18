# Autogenerated wrapper script for ZeroMQ_jll for x86_64-apple-darwin
export libzmq

JLLWrappers.@generate_wrapper_header("ZeroMQ")
JLLWrappers.@declare_library_product(libzmq, "@rpath/libzmq.5.dylib")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libzmq,
        "lib/libzmq.5.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
