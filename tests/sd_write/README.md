# SD write regression (GHDL)

The SPI card model initializes an SDHC card and validates all 512 payload bytes of three consecutive CMD24 writes. At 74.25 MHz, the old controller fails after approximately 59 ms of busy polling, and rejects even one idle byte before a write-response token.

From this directory, use an out-of-tree work directory:

```sh
GHDL=ghdl
TEST_DIR="$PWD"
WORK_DIR="$(mktemp -d)"
cd "$WORK_DIR"
"$GHDL" -a --std=08 "$TEST_DIR/../../src/sd_spi_block_reader.vhd" "$TEST_DIR/tb_sd_write.vhd"
"$GHDL" -e --std=08 tb_sd_write
"$GHDL" -r --std=08 tb_sd_write --assert-level=error
"$GHDL" -r --std=08 tb_sd_write -gBUSY_BYTES=100000 -gRESPONSE_DELAY=3 --assert-level=error
"$GHDL" -r --std=08 tb_sd_write -gBUSY_BYTES=600000 -gEXPECT_ERROR=true --assert-level=error
"$GHDL" -r --std=08 tb_sd_write -gRESPONSE_TOKEN=11 -gEXPECT_ERROR=true --assert-level=error
"$GHDL" -r --std=08 tb_sd_write -gRESPONSE_DELAY=32 -gEXPECT_ERROR=true --assert-level=error
```

All five runs must exit successfully. These cover consecutive writes, about 90 ms programming busy time with delayed response, the 500 ms timeout, CRC rejection and a missing response. This model checks the FPGA block controller, not FAT32 allocation or the monitor program. Tobias confirmed successful @DS saving on v3923 after flashing the corrected build on 2026-10-05. No independent byte-by-byte saved-file verification is recorded.
