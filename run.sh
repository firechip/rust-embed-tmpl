#!/bin/bash
cargo build
esptool.py  --chip esp32c3 elf2image target/riscv32imc-esp-espidf/debug/by-template
esptool.py --chip esp32c3 -p /dev/tty.usbserial-22440 -b 460800 --before=default_reset --after=hard_reset write_flash --flash_mode dio --flash_freq 40m --flash_size 4MB 0x10000 target/riscv32imc-esp-espidf/debug/by-template.bin
espmonitor /dev/tty.usbserial-22440