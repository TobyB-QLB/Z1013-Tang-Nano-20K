//Copyright (C)2014-2025 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.02 (64-bit) 
//Created Time: 2025-07-16 17:23:11
create_clock -name tmds_clk -period 13.468 -waveform {0 6.734} [get_pins {u_clkdiv/CLKOUT}]
create_clock -name I_clk -period 37.04 -waveform {0 18.52} [get_ports {I_clk}] -add

// MODE1 BL616 SPI; no timing exceptions within the SPI peripheral.
create_clock -name usb_spi_clk -period 50 -waveform {0 25} [get_ports {I_usb_sclk}]
set_input_delay -clock usb_spi_clk -max 5 [get_ports {I_usb_mosi}]
set_input_delay -clock usb_spi_clk -min 0 [get_ports {I_usb_mosi}]
set_output_delay -clock usb_spi_clk -clock_fall -max 5 [get_ports {O_usb_miso}]
set_output_delay -clock usb_spi_clk -clock_fall -min 0 [get_ports {O_usb_miso}]
set_clock_groups -asynchronous -group [get_clocks {usb_spi_clk}] -group [get_clocks {tmds_clk I_clk}]
set_false_path -from [get_ports {I_usb_cs_n}]
