#!/usr/bin/env ruby

# Erzeugt drei monochrome 256x256-Vollbilder fuer PUNIVERS.COM.
# Die Farbe kommt weiterhin aus dem parallelen Attributspeicher des FPGA.

WIDTH = 256
HEIGHT = 256

FONT = {
  " "=>%w[00000 00000 00000 00000 00000 00000 00000],
  "A"=>%w[01110 10001 10001 11111 10001 10001 10001],
  "B"=>%w[11110 10001 10001 11110 10001 10001 11110],
  "C"=>%w[01111 10000 10000 10000 10000 10000 01111],
  "D"=>%w[11110 10001 10001 10001 10001 10001 11110],
  "E"=>%w[11111 10000 10000 11110 10000 10000 11111],
  "F"=>%w[11111 10000 10000 11110 10000 10000 10000],
  "G"=>%w[01111 10000 10000 10111 10001 10001 01111],
  "H"=>%w[10001 10001 10001 11111 10001 10001 10001],
  "I"=>%w[11111 00100 00100 00100 00100 00100 11111],
  "J"=>%w[00111 00010 00010 00010 10010 10010 01100],
  "K"=>%w[10001 10010 10100 11000 10100 10010 10001],
  "L"=>%w[10000 10000 10000 10000 10000 10000 11111],
  "M"=>%w[10001 11011 10101 10101 10001 10001 10001],
  "N"=>%w[10001 11001 10101 10011 10001 10001 10001],
  "O"=>%w[01110 10001 10001 10001 10001 10001 01110],
  "P"=>%w[11110 10001 10001 11110 10000 10000 10000],
  "Q"=>%w[01110 10001 10001 10001 10101 10010 01101],
  "R"=>%w[11110 10001 10001 11110 10100 10010 10001],
  "S"=>%w[01111 10000 10000 01110 00001 00001 11110],
  "T"=>%w[11111 00100 00100 00100 00100 00100 00100],
  "U"=>%w[10001 10001 10001 10001 10001 10001 01110],
  "V"=>%w[10001 10001 10001 10001 10001 01010 00100],
  "W"=>%w[10001 10001 10001 10101 10101 10101 01010],
  "X"=>%w[10001 10001 01010 00100 01010 10001 10001],
  "Y"=>%w[10001 10001 01010 00100 00100 00100 00100],
  "Z"=>%w[11111 00001 00010 00100 01000 10000 11111],
  "0"=>%w[01110 10001 10011 10101 11001 10001 01110],
  "1"=>%w[00100 01100 00100 00100 00100 00100 01110],
  "2"=>%w[01110 10001 00001 00010 00100 01000 11111],
  "3"=>%w[11110 00001 00001 01110 00001 00001 11110],
  "4"=>%w[00010 00110 01010 10010 11111 00010 00010],
  "5"=>%w[11111 10000 10000 11110 00001 00001 11110],
  "6"=>%w[01110 10000 10000 11110 10001 10001 01110],
  "7"=>%w[11111 00001 00010 00100 01000 01000 01000],
  "8"=>%w[01110 10001 10001 01110 10001 10001 01110],
  "9"=>%w[01110 10001 10001 01111 00001 00001 01110],
  "-"=>%w[00000 00000 00000 11111 00000 00000 00000],
  ":"=>%w[00000 00100 00100 00000 00100 00100 00000],
  "."=>%w[00000 00000 00000 00000 00000 00110 00110]
}.freeze

def screen
  Array.new(HEIGHT) { Array.new(WIDTH, 0) }
end

def pixel(bitmap, x, y, value = 1)
  return unless x.between?(0, WIDTH - 1) && y.between?(0, HEIGHT - 1)
  bitmap[y][x] = value
end

def line(bitmap, x0, y0, x1, y1)
  dx = (x1 - x0).abs
  sx = x0 < x1 ? 1 : -1
  dy = -(y1 - y0).abs
  sy = y0 < y1 ? 1 : -1
  error = dx + dy
  loop do
    pixel(bitmap, x0, y0)
    break if x0 == x1 && y0 == y1
    twice = error * 2
    if twice >= dy
      error += dy
      x0 += sx
    end
    if twice <= dx
      error += dx
      y0 += sy
    end
  end
end

def box(bitmap, x, y, w, h)
  line(bitmap, x, y, x + w - 1, y)
  line(bitmap, x, y + h - 1, x + w - 1, y + h - 1)
  line(bitmap, x, y, x, y + h - 1)
  line(bitmap, x + w - 1, y, x + w - 1, y + h - 1)
end

def text_width(text, scale)
  text.length * 6 * scale - scale
end

def draw_text(bitmap, text, x, y, scale = 1)
  text.upcase.each_char.with_index do |character, index|
    glyph = FONT.fetch(character, FONT[" "])
    glyph.each_with_index do |row, gy|
      row.each_char.with_index do |bit, gx|
        next unless bit == "1"
        scale.times do |yy|
          scale.times { |xx| pixel(bitmap, x + index * 6 * scale + gx * scale + xx, y + gy * scale + yy) }
        end
      end
    end
  end
end

def centered_text(bitmap, text, y, scale = 1)
  draw_text(bitmap, text, (WIDTH - text_width(text, scale)) / 2, y, scale)
end

def ghost(bitmap, x, y, scale = 1)
  rows = %w[00111100 01111110 11111111 11011011 11111111 11111111 10110101 10011001]
  rows.each_with_index do |row, gy|
    row.each_char.with_index do |bit, gx|
      next unless bit == "1"
      scale.times { |yy| scale.times { |xx| pixel(bitmap, x + gx * scale + xx, y + gy * scale + yy) } }
    end
  end
end

def player(bitmap, x, y, scale = 1)
  rows = %w[00111100 01111110 11100111 11111111 01111110 00111100 01100110 11000011]
  rows.each_with_index do |row, gy|
    row.each_char.with_index do |bit, gx|
      next unless bit == "1"
      scale.times { |yy| scale.times { |xx| pixel(bitmap, x + gx * scale + xx, y + gy * scale + yy) } }
    end
  end
end

def vitamin(bitmap, x, y, scale = 1)
  rows = %w[00100 01110 11111 11111 11111 01110 00100]
  rows.each_with_index do |row, gy|
    row.each_char.with_index do |bit, gx|
      next unless bit == "1"
      scale.times { |yy| scale.times { |xx| pixel(bitmap, x + gx * scale + xx, y + gy * scale + yy) } }
    end
  end
end

def press(bitmap, x, y, length, scale = 1)
  (0...length).each { |yy| (2 * scale...6 * scale).each { |xx| pixel(bitmap, x + xx, y + yy) } }
  box(bitmap, x, y + length, 8 * scale, 8 * scale)
end

def border(bitmap)
  box(bitmap, 5, 5, 246, 246)
  box(bitmap, 9, 9, 238, 238)
  (16..240).step(16) do |x|
    pixel(bitmap, x, 7)
    pixel(bitmap, 255 - x, 248)
  end
end

def encode(bitmap)
  bitmap.flat_map do |row|
    row.each_slice(8).map { |bits| bits.reduce(0) { |byte, bit| (byte << 1) | bit } }
  end.pack("C*")
end

intro = screen
border(intro)
centered_text(intro, "Z-PUNIVERSE", 24, 3)
centered_text(intro, "DAS ABENTEUER IM FPGA", 61, 1)
press(intro, 34, 79, 30, 2)
player(intro, 112, 91, 4)
ghost(intro, 184, 92, 3)
centered_text(intro, "10 RAEUME - 3 VITAMINE", 139, 1)
centered_text(intro, "LINKS RECHTS: LAUFEN", 163, 1)
centered_text(intro, "HOCH: SPRINGEN", 177, 1)
centered_text(intro, "RUNTER: EISSTRAHL", 191, 1)
centered_text(intro, "ESC: START", 222, 2)

game_over = screen
border(game_over)
centered_text(game_over, "GAME OVER", 34, 4)
ghost(game_over, 45, 102, 4)
player(game_over, 112, 110, 3)
ghost(game_over, 178, 102, 4)
centered_text(game_over, "KEIN LEBEN MEHR", 160, 2)
centered_text(game_over, "ESC: NEUES SPIEL", 211, 2)

winner = screen
border(winner)
centered_text(winner, "WINNER", 30, 6)
(0...5).each { |i| vitamin(winner, 35 + i * 43, 95, 2) }
player(winner, 104, 130, 6)
centered_text(winner, "ALLE 10 RAEUME GESCHAFFT", 187, 1)
centered_text(winner, "ESC: NEUES SPIEL", 218, 2)

{
  "punivers_intro.bin" => intro,
  "punivers_game_over.bin" => game_over,
  "punivers_winner.bin" => winner
}.each do |name, bitmap|
  payload = encode(bitmap)
  raise "#{name}: falsche Groesse" unless payload.bytesize == 8192
  File.binwrite(File.join(__dir__, name), payload)
  File.binwrite(File.join(__dir__, name.sub(/\.bin\z/, ".pbm")), "P4\n256 256\n".b + payload)
  puts "#{name}: #{payload.bytesize} Bytes"
end
