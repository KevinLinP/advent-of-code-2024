# example2
# xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))

file = File.open(ARGV[0])
input = file.read

instructions = input.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/)
# instructions example
# [["mul(2,4)"],
#  ["don't()"],
#  ["mul(5,5)"],
#  ["mul(11,8)"],
#  ["do()"],
#  ["mul(8,5)"]]
instructions.flatten!

enabled = true
sum = 0

instructions.each do |instruction|
  if instruction == "do()"
    enabled = true
  elsif instruction == "don't()"
    enabled = false
  elsif enabled
    factors = instruction.match(/mul\((\d+),(\d+)\)/).captures.map(&:to_i)
    sum += factors[0] * factors[1]
  end
end

pp sum