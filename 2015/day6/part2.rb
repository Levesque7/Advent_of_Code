# --- Part Two ---
#
# You just finish implementing your winning light pattern when you realize
# you mistranslated Santa's message from Ancient Nordic Elvish.
#
# The light grid you bought actually has individual brightness controls;
# each light can have a brightness of zero or more. The lights all start at zero.
#
# The phrase turn on actually means that you should increase the brightness
# of those lights by 1.
#
# The phrase turn off actually means that you should decrease the brightness
# of those lights by 1, to a minimum of zero.
#
# The phrase toggle actually means that you should increase the brightness
# of those lights by 2.
#
# What is the total brightness of all lights combined after following Santa's instructions?
#
# For example:
#
# turn on 0,0 through 0,0 would increase the total brightness by 1.
# toggle 0,0 through 999,999 would increase the total brightness by 2000000.

require_relative 'lightswitch'

path = File.expand_path("../input.txt", __FILE__)
input = IO.readlines(path)

lights = Array.new(1000) { Array.new(1000, 0) }

input.each do |line|
  coords = line.scan(/\d{1,3}/).map(&:to_i)
  if line.include? "turn on"
    lights.turn_up(coords[0], coords[2], coords[1], coords[3])
  elsif line.include? "turn off"
    lights.turn_down(coords[0], coords[2], coords[1], coords[3])
  elsif line.include? "toggle"
    lights.toggle_up(coords[0], coords[2], coords[1], coords[3])
  end
end

puts lights.brightness
