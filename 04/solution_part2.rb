file = File.open(ARGV[0])
input = file.read

grid = input.split.map do |line|
  line.chars
end

count = 0

(1..grid.length - 2).each do |y|
  (1..grid[0].length - 2).each do |x|
    if grid[y][x] == 'A'
      downslope_corner_coords = [
        [x - 1, y - 1],
        [x + 1, y + 1]
      ]

      upslope_corner_coords = [
        [x - 1, y + 1],
        [x + 1, y - 1]
      ]

      x_mas = [downslope_corner_coords, upslope_corner_coords].all? do |corner_coords|
        letters = corner_coords.map do |coords|
          grid[coords[1]][coords[0]]
        end

        letters == ['M', 'S'] || letters == ['S', 'M']
      end

      count += 1 if x_mas
    end
  end
end

pp count
