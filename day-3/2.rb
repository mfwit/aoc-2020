def calculate_trees(x, y)
  input = File.readlines("input.txt").map do |line|
    l = line.chomp.strip
    line = l * 50
  end

  x_counter = 0
  y_counter = 0
  tree_count = 0

  input.delete_at(0)

  rows = input.count - 1
  start = y - 1
  start.step(rows, y).each do |yi|
    x_counter = x_counter + x
    # puts x_counter
    tree_count += 1 if input[yi][x_counter] == "#"
    puts "[#{yi},#{x_counter}]: #{tree_count}"
  end
  return tree_count
end

# puts "1,1: #{calculate_trees(1, 1)}"
# puts "3,1: #{calculate_trees(3, 1)}"
# puts "5,1: #{calculate_trees(5, 1)}"
# puts "7,1: #{calculate_trees(7, 1)}"
puts "1,2: #{calculate_trees(1, 2)}"
# multipled_trees = calculate_trees(1, 1) * calculate_trees(3, 1) * calculate_trees(5, 1) * calculate_trees(7, 1) * calculate_trees(1, 2)

# puts "Multiplied trees: #{multipled_trees}"





