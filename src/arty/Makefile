# Makefile — the Z1013 on the Digilent Arty A7-100T, co-simulated over Ethernet (or the USB-UART).  README.md says how.
#   make run-demo    load bit/z1013_arty.bit, open the screen + sound in the browser, type F2 + DEMO.COM
#   make run         the same, nothing typed (the browser page's keys: F1 @DD, F2 @DL, F3 DOS, F9..F12 the speed)
#   make console     only the host side (the board already loaded and running: --attach keeps it running)
#   make prog        load the bitstream (openFPGALoader; built from source by `make tools` when not installed)
#   make bitstream   build the bitstream with Vivado (~15 minutes) into build/
#   make card        build/card.img: the programs of ../../programs on a FAT32 image (served by the host, never written:
#                    the machine's writes go to build/card.cow)
# LINK=udp (default: the PC 192.168.77.1/24 on the port the Arty is cabled to, the board 192.168.77.2) or LINK=uart
# (the Arty's USB serial port, UART=/dev/ttyUSB1, 1 Mbaud).  SERIAL= picks one Arty by its JTAG cable's serial;
# ARGS= more options for host/z1013_console.py (--no-browser, --png FILE, --wav FILE, --seconds N, --ffplay, --help).
VIVADO   ?= $(firstword $(shell command -v vivado 2>/dev/null) $(wildcard /tools/Xilinx/*/Vivado/bin/vivado /opt/Xilinx/*/Vivado/bin/vivado $(HOME)/Xilinx/*/Vivado/bin/vivado))
# openFPGALoader: the one on the PATH, or else built here from source (`make tools`: libftdi1 v1.5 and openFPGALoader
# v1.1.1, fetched as git sources into build/tools/src, nothing prebuilt; needs cmake, a C/C++ compiler and the libusb-1.0,
# zlib and libudev development headers)
TOOLS    := build/tools
OFL_VER  ?= v1.1.1
FTDI_VER ?= v1.5
OFL      ?= $(or $(shell command -v openFPGALoader 2>/dev/null),$(TOOLS)/bin/openFPGALoader)
SERIAL   ?=
LINK     ?= udp
IP       ?= 192.168.77.2
UART     ?= /dev/ttyUSB1
PROGRAMS ?= DEMO/DEMO.COM TERTRIS/TERTRIS.COM PACMAN/PACMAN.COM KIKSTART/KIKSTART.COM PUNIVERS/PUNIVERS.COM
BIT      ?= $(if $(wildcard build/top.bit),build/top.bit,bit/z1013_arty.bit)

ifeq ($(LINK),uart)
LINKARG := --uart $(UART)
else
LINKARG := --udp $(IP)
endif
CONSOLE := python3 host/z1013_console.py $(LINKARG) --card build/card.img --cow build/card.cow $(ARGS)

.PHONY: run-demo run console prog bitstream card tools clean

run-demo: prog card
	@sleep 2
	$(CONSOLE) --keys host/keys_demo.txt

run: prog card
	@sleep 2
	$(CONSOLE)

console: card
	$(CONSOLE) --attach

prog: $(filter $(TOOLS)/%,$(OFL))
	$(OFL) -b arty_a7_100t $(if $(SERIAL),--ftdi-serial $(SERIAL)) $(BIT)

tools: $(TOOLS)/bin/openFPGALoader
$(TOOLS)/bin/openFPGALoader:
	@mkdir -p $(TOOLS)/src
	[ -d $(TOOLS)/src/libftdi ] || git clone --depth 1 -b $(FTDI_VER) git://developer.intra2net.com/libftdi $(TOOLS)/src/libftdi
	cmake -S $(TOOLS)/src/libftdi -B $(TOOLS)/b-libftdi -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(abspath $(TOOLS)) \
	      -DSTATICLIBS=ON -DSHAREDLIBS=OFF -DBUILD_TESTS=OFF -DDOCUMENTATION=OFF -DEXAMPLES=OFF -DFTDIPP=OFF \
	      -DFTDI_EEPROM=OFF -DPYTHON_BINDINGS=OFF -DLINK_PYTHON_LIBRARY=OFF
	cmake --build $(TOOLS)/b-libftdi -j 8 && cmake --install $(TOOLS)/b-libftdi
	[ -d $(TOOLS)/src/openFPGALoader ] || git clone --depth 1 -b $(OFL_VER) https://github.com/trabucayre/openFPGALoader.git $(TOOLS)/src/openFPGALoader
	PKG_CONFIG_PATH=$(abspath $(TOOLS))/lib/pkgconfig:$(abspath $(TOOLS))/lib64/pkgconfig:$$PKG_CONFIG_PATH \
	cmake -S $(TOOLS)/src/openFPGALoader -B $(TOOLS)/b-ofl -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(abspath $(TOOLS)) \
	      -DENABLE_CABLE_ALL=OFF -DENABLE_FTDI_BASED_CABLE=ON -DENABLE_VENDORS_ALL=OFF -DENABLE_XILINX_SUPPORT=ON
	cmake --build $(TOOLS)/b-ofl -j 8 && cmake --install $(TOOLS)/b-ofl

bitstream: build/top.bit
build/top.bit: vivado/build.tcl rtl/z1013_arty.v rtl/top.v rtl/Gowin_Z1013_ROM.vhd constr/top.xdc
	@[ -n "$(VIVADO)" ] || { echo "vivado not found: source its settings64.sh or set VIVADO="; exit 1; }
	@mkdir -p build
	cd build && $(VIVADO) -mode batch -nojournal -log vivado.log -source ../vivado/build.tcl

card: build/card.img
build/card.img: host/mkcard.sh
	@mkdir -p build
	sh host/mkcard.sh $@ $(addprefix ../../programs/,$(PROGRAMS))

clean:
	rm -rf build
