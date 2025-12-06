#!/usr/bin/env ruby -w

grid = []
operations = []
digits = []

File.open(ARGV[0]).readlines.each do
  if it =~ /\+|\*/
    operations = it.split
  else
    grid << it.split.map(&:to_i)
    digits << it.chomp.split(//)
  end
end

# 1st puzzle
first = operations.zip(grid.transpose).sum do |op, operands|
  operands.reduce(op.to_sym)
end
puts first

# 2nd puzzle
second = 0
op = operations.shift
operands = []
digits.first.size.times do |i|
  crt = digits.size.times.map { |j| digits[j][i] }.join("").to_i
  if crt.zero?
    second += operands.reduce(op.to_sym)
    op = operations.shift unless operations.empty?
    operands = []
  else
    operands << crt
  end
end
second += operands.reduce(op.to_sym)

puts second
