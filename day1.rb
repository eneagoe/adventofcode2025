#!/usr/bin/env ruby -w

dial = 50
first = 0
second = 0

File.open(ARGV[0]).each do
  dir = it[0] == 'L' ? -1 : 1
  dist = it[1..].to_i
  carry = dial.zero? ? 1 : 0

  if dir.positive?
    second += (dist + dial) / 100
  else
    second += (100 - (dist * dir + dial)) / 100 - carry
  end

  dial = (dial + dir * dist) % 100
  first += 1 if dial.zero?
end

puts first
puts second
