load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def bazel_esp32_dependencies():
    # The cross compiler, tools and headers.
    http_archive(
        name = "xtensa_esp32_elf_linux64",
        build_file = "@bazel_esp32//:BUILD.esp32toolchain",
        sha256 = "698d8407e18275d18feb7d1afdb68800b97904fbe39080422fb8609afa49df30",
        strip_prefix = "xtensa-esp32-elf",
        #urls = ["https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-97-gc752ad5-5.2.0.tar.gz"],
        urls = [
            "https://github.com/espressif/crosstool-NG/releases/download/esp-2022r1/xtensa-esp32-elf-gcc11_2_0-esp-2022r1-linux-amd64.tar.xz",
        ],
    )

    # The Arduino base libraries.
    http_archive(
        name = "arduino_esp32",
        build_file = "@bazel_esp32//:BUILD.esp32",
        strip_prefix = "esp32-2.0.5",
        sha256 = "c7a1040c5f007a799ef9eb249508e3544c3cf5246f67cdfdc1e80f7d0ca7b41d",
        urls = ["https://github.com/espressif/arduino-esp32/releases/download/2.0.5/esp32-2.0.5.zip"],
    )
