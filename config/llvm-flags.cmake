# Initial CMake cache for building LLVM the way roadrunner needs it.
# Usage: cmake -C config/llvm-flags.cmake -S <llvm-project>/llvm -B build -G Ninja ...

# roadrunner subclasses LLVM polymorphic types and links with RTTI/exceptions on.
set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_ENABLE_EH ON CACHE BOOL "")

# roadrunner only JITs for the host.
set(LLVM_TARGETS_TO_BUILD "X86;AArch64" CACHE STRING "")

# Avoid extra link dependencies.
set(LLVM_ENABLE_ZLIB OFF CACHE STRING "")
set(LLVM_ENABLE_ZSTD OFF CACHE STRING "")
set(LLVM_ENABLE_LIBXML2 OFF CACHE STRING "")
set(LLVM_ENABLE_TERMINFO OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBEDIT OFF CACHE BOOL "")
set(LLVM_ENABLE_CURL OFF CACHE STRING "")
set(LLVM_ENABLE_HTTPLIB OFF CACHE STRING "")
set(LLVM_ENABLE_Z3_SOLVER OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBPFM OFF CACHE BOOL "")

# Static libraries only.
set(LLVM_BUILD_LLVM_DYLIB OFF CACHE BOOL "")
set(LLVM_LINK_LLVM_DYLIB OFF CACHE BOOL "")

# Skip everything roadrunner does not use.
set(LLVM_INCLUDE_TESTS OFF CACHE BOOL "")
set(LLVM_INCLUDE_EXAMPLES OFF CACHE BOOL "")
set(LLVM_INCLUDE_BENCHMARKS OFF CACHE BOOL "")
set(LLVM_INCLUDE_DOCS OFF CACHE BOOL "")
set(LLVM_INCLUDE_UTILS OFF CACHE BOOL "")
set(LLVM_ENABLE_BINDINGS OFF CACHE BOOL "")

# Faster build when assertions are on.
set(LLVM_OPTIMIZED_TABLEGEN ON CACHE BOOL "")
