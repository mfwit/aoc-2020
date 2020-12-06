input = File.read("input.txt").split("\n\n")
total_count = 0
input.each do |group|
  answer_count = 0
  group_count = group.lines.count
  alphabet = ('a'..'z')
  alphabet.each do |letter|
    answer_count += 1 if group.count(letter) == group_count
  end
  puts "#{group_count}: #{answer_count}"
  total_count += answer_count
end
puts total_count