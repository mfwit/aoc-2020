input = File.readlines("input.txt")
pos_count = 0
input.each do |line|
  l = line.split(" ")
  min = l[0].split("-")[0].to_i
  max = l[0].split("-")[1].to_i
  letter = l[1][0]
  password = l[2]
  letter_count = password.count(letter)
  if letter_count >= min && letter_count <= max
    pos_count += 1
  end
  puts pos_count
end