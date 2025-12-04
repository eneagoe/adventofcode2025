#!/usr/bin/env ruby -w

def count_neighbours(i, j, grid)
  n = grid.size
  m = grid[0].size
  neighbours = 0

  neighbours += 1 if i.positive? && j.positive? && grid[i - 1][j - 1] == '@'
  neighbours += 1 if i.positive? && grid[i - 1][j] == '@'
  neighbours += 1 if i.positive? && j < m - 1 && grid[i - 1][j + 1] == '@'
  neighbours += 1 if j.positive? && grid[i][j - 1] == '@'
  neighbours += 1 if j < m - 1 && grid[i][j + 1] == '@'
  neighbours += 1 if i < n - 1 && j.positive? && grid[i + 1][j - 1] == '@'
  neighbours += 1 if i < n - 1 && grid[i + 1][j] == '@'
  neighbours += 1 if i < n - 1 && j < m - 1 && grid[i + 1][j + 1] == '@'

  neighbours
end

# 1st puzzle
first = 0

grid = File.open(ARGV[0]).readlines.map.with_index do |line, i|
  line.chomp.split(//)
end

n = grid.size
m = grid[0].size

n.times.each do |i|
  m.times.each do |j|
    first += 1 if grid[i][j] == '@' && count_neighbours(i, j, grid) < 4
  end
end

puts first

# 2nd puzzle
second = 0
new_grid = Marshal.load(Marshal.dump(grid))

while true
  n.times.each do |i|
    m.times.each do |j|
      if grid[i][j] == '@' && count_neighbours(i, j, grid) < 4
        second += 1
        new_grid[i][j] = '.'
      end
    end
  end

  break if new_grid == grid
  grid = Marshal.load(Marshal.dump(new_grid))
end

puts second
