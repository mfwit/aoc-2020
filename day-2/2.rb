input = File.readlines("input.txt")
pos_count = 0
input.each do |line|
  l = line.split(" ")
  f_pos = l[0].split("-")[0].to_i - 1
  s_pos = l[0].split("-")[1].to_i - 1
  letter = l[1][0]
  password = l[2]
  letter_count = password.count(letter)
  if (password[f_pos] == letter && password[s_pos] != letter) || (password[f_pos] != letter && password[s_pos] == letter)
    pos_count += 1
  end
  puts pos_count
end