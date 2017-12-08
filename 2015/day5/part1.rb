# --- Day 5: Doesn't He Have Intern-Elves For This? ---
#
# Santa needs help figuring out which strings in his text file are
# naughty or nice.
#
# A nice string is one with all of the following properties:
#
# It contains at least three vowels (aeiou only), like aei, xazegov,
# or aeiouaeiouaeiou.
# It contains at least one letter that appears twice in a row, like xx,
# abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# It does not contain the strings ab, cd, pq, or xy,
# even if they are part of one of the other requirements.
#
# For example:
#
# ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...),
# a double letter (...dd...), and none of the disallowed substrings.
# aaa is nice because it has at least three vowels and a double letter,
# even though the letters used by different rules overlap.
# jchzalrnumimnmhp is naughty because it has no double letter.
# haegwjzuvuyypxyu is naughty because it contains the string xy.
# dvszwmarrgswjxmb is naughty because it contains only one vowel.
#
# How many strings are nice?

path = File.expand_path("../input.txt", __FILE__)
input = IO.readlines(path)

nice = 0

input.each do |string|
vowels = string.scan(/[aeiou]/)
doubles = string.scan(/(\w)\1/)
forbidden = string.scan(/(ab)|(cd)|(pq)|(xy)/)

  if (vowels.length >= 3 && doubles.length >= 1 && forbidden.length == 0)
    nice += 1
  end
end

puts nice
