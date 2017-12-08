# --- Part Two ---
#
# The next year, to speed up the process, Santa creates a robot version of
# himself, Robo-Santa, to deliver presents with him.
#
# Santa and Robo-Santa start at the same location (delivering two presents
# to the same starting house), then take turns moving based on instructions
# from the elf, who is eggnoggedly reading from the same script as the
# previous year.
#
# This year, how many houses receive at least one present?
#
# For example:
#
# ^v delivers presents to 3 houses, because Santa goes north, and then
# Robo-Santa goes south.
#
# ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end
# up back where they started.
#
# ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one
# direction and Robo-Santa going the other.

input = File.expand_path("../input.txt", __FILE__)
file = File.read(input)
moves = file.split(//)

houses = {"0,0" => 2}
ns_santa = 0 #North-South coordinate for Santa
ew_santa = 0 #East-West coordinate for Santa
ns_robo = 0 #North-South coordinate for Robo-Santa
ew_robo = 0 #East-West coordinate for Robo-Santa

def movementTracking (c, ns, ew, houses)
  ns_move = 0
  ew_move = 0
  if c == "<"
    ew -= 1
    ew_move -= 1
  end
  if c == ">"
    ew += 1
    ew_move += 1
  end
  if c == "v"
    ns -= 1
    ns_move -= 1
  end
  if c == "^"
    ns += 1
    ns_move += 1
  end
  #Add house coordinates to hash, and track number of visits to that house
  value = 1
  if houses.has_key?("#{ns.to_s},#{ew.to_s}")
    value = houses.fetch("#{ns.to_s},#{ew.to_s}") + 1
    houses.delete("#{ns.to_s},#{ew.to_s}")
  end
    houses["#{ns.to_s},#{ew.to_s}"] = value
  return ns_move, ew_move
end

counter = 0

moves.each do |c|
  #Santa's movement
  if counter % 2 == 0
    ns, ew = movementTracking(c, ns_santa, ew_santa, houses)
    ns_santa += ns
    ew_santa += ew
  end
  #Robo-Santa's movement
  if counter % 2 != 0
    ns, ew = movementTracking(c, ns_robo, ew_robo, houses)
    ns_robo += ns
    ew_robo += ew
  end
  counter += 1
end

puts "Presents were delivered to #{houses.length} houses."
