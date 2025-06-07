"""Public API for the ESP32 ruleset."""

def esp32_image(
        name,
        src,
        chip = "esp32",
        flash_mode = "dio",
        flash_freq = "80m",
        flash_size = "4MB"):
    """Macro that wraps a genrule to convert an ELF file to a flashable binary image.

    Args:
      name: A unique name for this target.
      src: The label of the input ELF file target.
      chip: The target chip type, corresponds to the esptool.py --chip flag.
        For a full list of supported chips, see:
        https://github.com/espressif/esptool/blob/89e8dd05b5100a497e4f6e7b71ad8e9f2e3e5cc6/esptool/targets/__init__.py#L16
      flash_mode: Sets the SPI flash I/O mode. Valid values include 'qio', 'qout',
        'dio', and 'dout'.
        See: https://docs.espressif.com/projects/esptool/en/latest/esp32/esptool/flash-modes.html#flash-mode
      flash_freq: Sets the SPI flash clock frequency. Valid values include '40m',
        '26m', '20m', and '80m' (MHz).
        See: https://docs.espressif.com/projects/esptool/en/latest/esp32/esptool/flash-modes.html#flash-frequency
      flash_size: The total size of the SPI flash chip, e.g., '4MB'. If set to
        'detect', esptool will try to autodetect the size.
        See: https://docs.espressif.com/projects/esptool/en/latest/esp32/esptool/flash-modes.html#flash-size
    """

    esptool = "@esptool//:esptool"

    native.genrule(
        name = name,
        srcs = [src],
        outs = [name],
        cmd = """
        $(location {esptool}) --chip {chip} elf2image \\
            --flash_mode {flash_mode} \\
            --flash_freq {flash_freq} \\
            --flash_size {flash_size} \\
            -o $@ $<
        """.format(
            esptool = esptool,
            chip = chip,
            flash_mode = flash_mode,
            flash_freq = flash_freq,
            flash_size = flash_size,
        ),
        tools = [esptool],
    )