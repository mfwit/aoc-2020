input = File.read("input.txt").split("\n\n")
total_count = 0
input.each do |line|
  line_count = 0
  alphabet = ('a'..'z')
  alphabet.each do |letter|
    line_count += 1 if line.include?(letter)
  end
  puts "#{line_count}: #{line}"
  total_count += line_count
end
puts total_count