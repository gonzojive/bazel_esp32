"""Public API for the ESP32 ruleset."""

# Load the implementation details from our internal file.
load(":esp32_binary.bzl", _esp32_binary = "esp32_binary")
load(":esp32_image.bzl", _esp32_image = "esp32_image")
load(":esp32_partitions.bzl", _esp32_partitions = "esp32_partitions")

esp32_binary = _esp32_binary
esp32_image = _esp32_image
esp32_partitions = _esp32_partitions
