# This file contains the private implementation of our rule.

def _to_xtensa_cpu_transition(settings, attr):
    """This transition changes the CPU to 'xtensa'."""
    return {"//command_line_option:cpu": "xtensa"}

# The transition is an implementation detail, so it belongs here.
to_xtensa_cpu = transition(
    implementation = _to_xtensa_cpu_transition,
    inputs = [],
    outputs = ["//command_line_option:cpu"],
)

def _esp32_binary_impl(ctx):
    """The rule's implementation function."""
    return [DefaultInfo(files = depset(ctx.files.dep))]

esp32_binary = rule(
    implementation = _esp32_binary_impl,
    doc = "A rule that builds its dependency for the ESP32 (xtensa cpu).",
    attrs = {
        "dep": attr.label(
            doc = "The target to build for the ESP32, typically a cc_binary.",
            mandatory = True,
            cfg = to_xtensa_cpu,
        ),
    },
)
