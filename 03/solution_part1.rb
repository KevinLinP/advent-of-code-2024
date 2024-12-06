file = File.open(ARGV[0])
input = file.read

instructions = input.scan(/mul\(\d+,\d+\)/)
# instructions example
# ["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"]

multiplications = instructions.map do |instruction|
  instruction.match(/mul\((\d+),(\d+)\)/).captures.map(&:to_i)
end

products = multiplications.map do |multiplication|
  multiplication[0] * multiplication[1]
end

pp products.sum