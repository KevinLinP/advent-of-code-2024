file = File.open(ARGV[0])

left_list = []
right_list = []

# example.txt
# 3   4
# 4   3
# 2   5
# 1   3
# 3   9
# 3   3

file.each_line do |line|
  if line =~ /(\d+)\s+(\d+)/
    left_list << $1.to_i
    right_list << $2.to_i
  end
end

left_list.sort!
right_list.sort!

result = left_list.zip(right_list).reduce(0) do |sum, (left, right)|
  sum + (left - right).abs
end

pp result