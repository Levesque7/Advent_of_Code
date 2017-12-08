# --- Part Two ---
#
# Now find one that starts with six zeroes.

require 'digest'

input = "bgvyzdsv"
i = 0
dig = Digest::MD5.new

while (dig.hexdigest("#{input}#{i}")[0,6] != "000000") do i += 1 end
puts "Solution: #{i}"
