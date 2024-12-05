file = File.open(ARGV[0])

left_list = []
right_list = []

file.each_line do |line|
  if line =~ /(\d+)\s+(\d+)/
    left_list << $1.to_i
    right_list << $2.to_i
  end
end

left_frequencies = left_list.each_with_object(Hash.new(0)) { |left, h| h[left] += 1 }
right_frequencies = right_list.each_with_object(Hash.new(0)) { |right, h| h[right] += 1 }

result = left_frequencies.reduce(0) do |sum, (number, left_count)|
  right_count = right_frequencies[number] || 0
  result = right_count * left_count * number

  sum += result
end

pp result
