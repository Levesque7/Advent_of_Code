# --- Part Two ---
#
# Now, given the same instructions, find the position of the first character
# that causes him to enter the basement (floor -1). The first character in the
# instructions has position 1, the second character has position 2, and so on.
#
# For example:
#
# ) causes him to enter the basement at character position 1.
# ()()) causes him to enter the basement at character position 5.
# What is the position of the character that causes Santa to first enter the
# basement?

floor = 0
basementEntries = []

input = File.expand_path("../input.txt", __FILE__)
file = File.read(input)

array = file.split(//)
array.each_with_index do |char, index|
  if char == "("
    floor += 1
  end
  if char == ")"
    floor -= 1
  end
  if (floor == -1 && char == ")")
    basementEntries.push(index + 1)
  end
end

puts "Santa was taken to floor #{floor}"
puts "But he first went into the basement at position #{basementEntries[0]}"
