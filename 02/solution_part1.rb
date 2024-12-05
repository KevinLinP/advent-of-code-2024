# example
# 7 6 4 2 1
# 1 2 7 8 9
# 9 7 6 2 1
# 1 3 2 4 5
# 8 6 4 4 1
# 1 3 6 7 9


SAFE_RANGE = (1..3)

file = File.open(ARGV[0])

safe_count = 0

file.each_line do |line|
  report = line.split.map(&:to_i)

  if report.first > report.last
    report.reverse!
  end

  differences = report.each_cons(2).map do |a, b|
    b - a
  end

  is_safe = differences.all? do |difference|
    SAFE_RANGE.include?(difference)
  end

  safe_count += 1 if is_safe
end

pp safe_count