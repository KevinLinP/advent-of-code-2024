file = File.open(ARGV[0])
input = file.read

grid = input.split.map do |line|
  line.chars.map(&:to_sym)
end

count = 0

MAS_CORNERS = [[:M, :S], [:S, :M]]

(1..grid.length - 2).each do |y|
  (1..grid[0].length - 2).each do |x|
    next unless grid[y][x] == :A

    downslope_coords = [
      [x - 1, y - 1],
      [x + 1, y + 1]
    ]

    upslope_coords = [
      [x - 1, y + 1],
      [x + 1, y - 1]
    ]

    count += 1 if [downslope_coords, upslope_coords].all? do |coords|
      letters = coords.map do |coord|
        grid[coord[1]][coord[0]]
      end

      MAS_CORNERS.include?(letters)
    end
  end
end

pp count
