#!/usr/bin/env ruby -w

first = 0
intervals = []

File.open(ARGV[0]).readlines.each do
  if it.include? "-"
    intervals << Range.new(*it.chomp.split("-").map(&:to_i))
  else
    v = it.to_i
    next if v.zero?

    first += 1 if intervals.any? { it.cover?(v) }
  end
end

puts first

# 2nd puzzle
# reduce the intervals to their union
intervals.sort! { |r1, r2| r1.begin <=> r2.begin }
union = []
intervals.each do
  if union.empty? || !it.overlap?(union.last)
    union << it
  else
    last = union.pop
    union << Range.new(last.begin, [last.end, it.end].max)
  end
end

puts union.sum(&:size)
