load(":cc_toolchain_config.bzl", "cc_toolchain_config")
load("@rules_cc//cc:defs.bzl", "cc_toolchain_suite", "cc_toolchain")

package(default_visibility = ["//visibility:public"])

cc_toolchain_suite(
    name = "esp32",
    toolchains = {
        "xtensa": ":esp32_toolchain_xtensa",
    },
)

filegroup(name = "empty")

filegroup(
    name = "all_files",
    srcs = [
        ":cc_wrapper",
        ":xtensa-esp32-elf-ar",
        ":xtensa-esp32-elf-ld",
        "@arduino_esp32//:sources",
        "@xtensa_esp32_elf_linux64//:compiler_pieces",
        "@bazel_tools//tools/bash/runfiles",
    ],
)

sh_binary(
    name = "cc_wrapper",  # You can keep the same name if replacing the filegroup
    srcs = ["cc_wrapper.sh"],
    data = [
        "@xtensa_esp32_elf_linux64//:compiler_pieces",  # Provides the actual compilers
        "@bazel_tools//tools/bash/runfiles",       # For the runfiles library used in the script
    ],
    visibility = ["//visibility:public"], # Or adjust visibility as needed
)

cc_toolchain(
    name = "esp32_cc_toolchain_xtensa",
    all_files = ":all_files",
    ar_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_config = ":xtensa_toolchain_config",
    toolchain_identifier = "esp32-xtensa-toolchain",
)

toolchain(
    name = "esp32_toolchain_xtensa",
    exec_compatible_with = [
        "@platforms//os:linux",
    ],
    toolchain = ":esp32_cc_toolchain_xtensa",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    visibility = ["//visibility:public"],
)

cc_toolchain_config(name = "xtensa_toolchain_config")
