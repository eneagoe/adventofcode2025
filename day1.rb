#!/usr/bin/env ruby -w

dial = 50
first = 0

File.open(ARGV[0]).each do
  dir = it[0] == 'L' ? -1 : 1
  dist = it[1..].to_i

  dial = (dial + dir * dist) % 100
  first += 1 if dial.zero?
end

puts first
