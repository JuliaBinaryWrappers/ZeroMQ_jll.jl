# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule ZeroMQ_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("ZeroMQ")
JLLWrappers.@generate_main_file("ZeroMQ", UUID("8f1865be-045e-5c20-9c9f-bfbfb0764568"))
end  # module ZeroMQ_jll
