#!/usr/bin/env ruby

require "digest"

project = File.expand_path("../..", __dir__)
base_path = File.join(project, "src", "gowin_rom", "z1013_boot_rom.bin")
io_path = File.join(__dir__, "IO_FAT32_DL.BIN")
ds_path = File.join(__dir__, "DS_FAT32.BIN")
dk_path = File.join(__dir__, "DK_FAT32.BIN")
output_path = File.join(__dir__, "z1013_boot_fat32_ds.bin")

rom = File.binread(base_path).bytes
io = File.binread(io_path).bytes
ds = File.binread(ds_path).bytes
dk = File.binread(dk_path).bytes

raise "Boot-ROM ist nicht exakt 8 KiB gross." unless rom.length == 0x2000
raise "Neue IO.SYS ist groesser als E300h..EBFFh." if io.length > 0x0900
raise "@DS-Erweiterung ist groesser als D300h..D8FFh." if ds.length > 0x0600
raise "@DK-Erweiterung ist groesser als D900h..DA1Fh." if dk.length > 0x0120
command_bytes = rom[0x0100, 0x0F01].dup
command_bytes[-1] = 0                 # ROM 1000h is now occupied by @DK
command_hash = Digest::SHA256.hexdigest(command_bytes.pack("C*"))
expected_command_hash = "d0ed5e1608de85655ecdd14d14a6618c2e5673cb97daf57fc941286ca27f1521"
raise "COMMAND.COM fehlt oder wurde veraendert." unless command_hash == expected_command_hash

io_area = Array.new(0x0900, 0)
io_area[0, io.length] = io
rom[0x1100, 0x0900] = io_area

ds_area = Array.new(0x0600, 0)
ds_area[0, ds.length] = ds
rom[0x1A00, 0x0600] = ds_area

dk_area = Array.new(0x0100, 0)
dk_area[0, [dk.length, 0x0100].min] = dk[0, 0x0100]
rom[0x1000, 0x0100] = dk_area
dk_tail = Array.new(0x20, 0)
dk_tail[0, [dk.length - 0x100, 0].max] = dk[0x100, 0x20] || []
rom[0x60, 0x20] = dk_tail

# Der bisherige, nicht mehr verwendete virtuelle Directory-Puffer wurde von
# ROM 1A00h nach DC00h kopiert. Jetzt wird dort die @DS-Erweiterung abgelegt
# und beim Start nach D300h kopiert.
rom[0x29, 2] = [0x00, 0xD3]
rom[0x2C, 2] = [0x00, 0x06]

# After copying @DS, copy the formerly unused ROM page 1000h..10FFh to
# D900h..D9FFh, then continue with the original jump to E200h.
rom[0x30, 25] = [
  0x21, 0x00, 0x10,             # LD HL,1000h
  0x11, 0x00, 0xD9,             # LD DE,D900h
  0x01, 0x00, 0x01,             # LD BC,0100h
  0xED, 0xB0,                   # LDIR
  0x21, 0x60, 0x00,             # LD HL,0060h
  0x11, 0x00, 0xDA,             # LD DE,DA00h
  0x01, 0x20, 0x00,             # LD BC,0020h
  0xED, 0xB0,                   # LDIR
  0xC3, 0x00, 0xE2              # JP E200h
]

raise "Interner Fehler: erzeugtes Boot-ROM ist nicht exakt 8 KiB gross." unless rom.length == 0x2000

File.binwrite(output_path, rom.pack("C*"))

puts "OK: neue FAT32-IO.SYS in das 8-KiB-Boot-ROM eingesetzt."
puts format("IO.SYS: %d Bytes, RAM E300h..%04Xh", io.length, 0xE300 + io.length - 1)
puts format("@DS: %d Bytes, RAM D300h..%04Xh", ds.length, 0xD300 + ds.length - 1)
puts format("@DK: %d Bytes, RAM D900h..%04Xh", dk.length, 0xD900 + dk.length - 1)
puts "Boot-ROM: #{output_path}"
puts "SHA-256: #{Digest::SHA256.hexdigest(rom.pack('C*'))}"
