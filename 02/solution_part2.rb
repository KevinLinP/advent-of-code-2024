# example
# 7 6 4 2 1
# 1 2 7 8 9
# 9 7 6 2 1
# 1 3 2 4 5
# 8 6 4 4 1
# 1 3 6 7 9

SAFE_RANGE = (1..3)

def safe_report?(report)
  original_is_safe = report.each_cons(2).all? do |a, b|
    SAFE_RANGE.include?(b - a)
  end

  return true if original_is_safe

  report.combination(report.length - 1).any? do |new_report|
    new_report.each_cons(2).all? do |a, b|
      SAFE_RANGE.include?(b - a)
    end
  end
end

file = File.open(ARGV[0])

safe_report_count= 0

file.each_line do |line|
  report = line.split.map(&:to_i)

  if safe_report?(report) || safe_report?(report.reverse)
    safe_report_count += 1
  end
end

pp safe_report_count