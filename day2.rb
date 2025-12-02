#!/usr/bin/env ruby -w

first = Set.new
second = Set.new

intervals = File.read(ARGV[0]).split(/,/).map { Range.new(*it.split("-").map(&:to_i)) }
# the numbers are less than 1e10, apparently
limit = 10**10

# try aa numbers
(1..9).each do |a|
  n = a * 10 + a

  if intervals.any? { it.cover?(n) }
    first << n
    second << n
  end

  while n < limit
    n = n * 10 + a

    second << n if intervals.any? { it.cover?(n) }
  end
end

# try abab numbers
(1..9).each do |a|
  (0..9).each do |b|
    part = a * 10 + b
    n = part * 100 + part

    if intervals.any? { it.cover?(n) }
      first << n
      second << n
    end

    while n < limit
      n = n * 100 + part

      second << n if intervals.any? { it.cover?(n) }
    end
  end
end

# try abcabc numbers
(1..9).each do |a|
  (0..9).each do |b|
    (0..9).each do |c|
      part = a * 100 + b * 10 + c
      n = part * 1000 + part

      if intervals.any? { it.cover?(n) }
        first << n
        second << n
      end

      while n < limit
        n = n * 1000 + part

        second << n if intervals.any? { it.cover?(n) }
      end
    end
  end
end

# try abcdabcd numbers
(1..9).each do |a|
  (0..9).each do |b|
    (0..9).each do |c|
      (0..9).each do |d|
        part = a * 1000 + b * 100 + c * 10 + d
        n = part * 10000 + part

        if intervals.any? { it.cover?(n) }
          first << n
          second << n
        end
      end
    end
  end
end

# try abcdeabcde numbers
(1..9).each do |a|
  (0..9).each do |b|
    (0..9).each do |c|
      (0..9).each do |d|
        (0..9).each do |e|
          part = a * 10000 + b * 1000 + c * 100 + d * 10 + e
          n = part * 100000 + part

          if intervals.any? { it.cover?(n) }
            first << n
            second << n
          end
        end
      end
    end
  end
end

puts first.sum
puts second.sum
