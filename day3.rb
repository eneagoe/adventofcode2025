#!/usr/bin/env ruby -w

first = 0
second = 0

def largest_subsequence(arr, k)
  n = arr.size
  removing = n - k
  s = []

  arr.each_with_index do |d, i|
    while !s.empty? && removing.positive? && s[-1] < d
      s.pop
      removing -= 1
    end

    s << d
  end

  while removing.positive?
    s.pop
    removing -= 1
  end

  s.reduce(0) { |r, v| r * 10 + v }
end

File.open(ARGV[0]).each do
  digits = it.chomp.split(//).map &:to_i
  first += digits.combination(2).map { it.first * 10 + it.last }.max

  # for 12 digits using combinations is not fast enough - use a monotonic stack algorithm
  second += largest_subsequence(digits, 12)
end

puts first
puts second
