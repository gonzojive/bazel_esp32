#!/bin/bash

set -e

#echo "listing files in cc_wrapper..."
#echo "$PWD"
#ls -l -a * && exit 1

XTENSA_GCC="external/+esp32_dependencies_extension+xtensa_esp32_elf_linux64/bin/xtensa-esp32-elf-gcc"
XTENSA_GPP="external/+esp32_dependencies_extension+xtensa_esp32_elf_linux64/bin/xtensa-esp32-elf-g++"

# Switch compiler based on the presence of the -std=gnu99 flag.
if [[ "$*" == *gnu99* ]]
then
  exec "${XTENSA_GCC}" "$@"
elif [[ "$*" == *esp32.rom.ld* ]] # Assuming this specific linker script implies g++
then
  exec "${XTENSA_GPP}" "$@"
else
  exec "${XTENSA_GPP}" "$@"
fi