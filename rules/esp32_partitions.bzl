def esp32_partitions(
        name,
        csv,
        partition_tool = "@arduino_esp32//:gen_esp32part"):
    """Generates a binary partition table from a CSV file.

    A partition table divides the ESP32's flash memory into separate sections
    for different purposes. This includes partitions for application code (like 'app'
    or 'ota' slots), data storage (like 'nvs' for configuration or 'spiffs'/'fat'
    for filesystems), and other core functions. This binary output is flashed to the
    device to define this memory layout.

    For a detailed guide on partition tables, see:
    https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/partition-tables.html

    Args:
      name: A unique name for this target. The output file will be
        named `<name>.bin`.
      csv: The label of the input CSV file that defines the partition layout.
        For details on the CSV format, see:
        https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/partition-tables.html#creating-custom-tables
      partition_tool: The `gen_esp32part.py` script used to generate the
        partition binary from the CSV file.
    """
    native.genrule(
        name = name,
        srcs = [],
        outs = [name],
        cmd = "$(location {tool}) $(location {csv_file}) $@".format(
            tool = partition_tool,
            csv_file = csv,
        ),
        tools = [
            partition_tool,
            csv,
        ],
    )