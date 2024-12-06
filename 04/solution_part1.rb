def down_slope_diagonal(grid:, x:, y:)
  diagonal = []
  while y < grid.length && x < grid[0].length
    diagonal << grid[y][x]
    x += 1
    y += 1
  end
  diagonal.join
end

def up_slope_diagonal(grid:, x:, y:)
  diagonal = []
  while y >= 0 && x < grid[0].length
    diagonal << grid[y][x]
    x += 1
    y -= 1
  end
  diagonal.join
end

def diagonals(grid:)
  down_slope_diagonals = []
  up_slope_diagonals = []

  grid.length.times do |y|
    down_slope_diagonals << down_slope_diagonal(grid:, x: 0, y:)
    up_slope_diagonals << up_slope_diagonal(grid:, x: 0, y:)
  end

  grid[0].length.times do |x|
    next if x == 0
    down_slope_diagonals << down_slope_diagonal(grid:, x:, y: 0)
    up_slope_diagonals << up_slope_diagonal(grid:, x:, y: grid.length - 1)
  end

  # pp({
  #   down_slope_diagonals:,
  #   up_slope_diagonals:
  # })

  down_slope_diagonals + up_slope_diagonals
end

def columns(grid:)
  grid[0].length.times.map do |x|
    grid.map do |row|
      row[x]
    end.join
  end
end

def rows(grid:)
  grid.map do |row|
    row.join
  end
end

file = File.open(ARGV[0])
input = file.read

grid = input.split.map do |line|
  line.chars
end

# pp rows(grid:)
# pp columns(grid:)
# pp diagonals(grid:)

count = 0

rows(grid:).each do |row|
  count += row.scan('XMAS').length
  count += row.scan('SAMX').length
end

columns(grid:).each do |column|
  count += column.scan('XMAS').length
  count += column.scan('SAMX').length
end

diagonals(grid:).each do |diagonal|
  count += diagonal.scan('XMAS').length
  count += diagonal.scan('SAMX').length
end

pp count