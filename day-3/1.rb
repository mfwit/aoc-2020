x_counter = 0
y_counter = 0
tree_count = 0

x_int = 3
y_int = 1

input = File.readlines("input.txt").map do |line|
  l = line.chomp.strip
  line = l * 50
end

input.delete_at(0)

input.each.with_index do |line, y|
  x_counter += x_int
  tree_count += 1 if line[x_counter] == "#"
  puts "[#{y},#{x_counter}]: #{tree_count}"
end



