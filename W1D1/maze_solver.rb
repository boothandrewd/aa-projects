# w1d1/maze_solver.rb

def maze_solver(traversed_coordinates)
  current_coordinates = traversed_coordinates.last
  surrounding_options = surrounding_coordinates(current_coordinates)
  in_range_options = surrounding_options.select { |pair| in_range?(pair) }
  valid_options = in_range_options.select { |pair| }
end

def detect_start(maze_array)
  maze_array.each_with_index do |row, row_index|
    row.each_with_index do |char, col_index|
      return [row_index, col_index] if char == 'S'
    end
  end
end

def surrounding_coordinates(coordinates)
  [
    [coordinates[0], coordinates[1] - 1],
    [coordinates[0], coordinates[1] + 1],
    [coordinates[0] - 1, coordinates[1]],
    [coordinates[0] + 1, coordinates[1]]
  ]
end

def in_range?(maze_array, coordinates)
  (0...maze_array.size) === coordinates[0] && (0...maze_array.first.size) === coordinates[1]
end

if __FILE__ == $PROGRAM_NAME
  maze_array = File.readlines('maze1.txt').map(&:chomp).map(&:chars)
end
