max_id = 0
input = File.readlines("input.txt").map do |line|
  row_str = line[0..6]
  seat_str = line[7..9]

  row_str.gsub!("F", "0")
  row_str.gsub!("B", "1")
  row = row_str.to_i(2)

  seat_str.gsub!("L", "0")
  seat_str.gsub!("R", "1")
  seat = seat_str.to_i(2)

  id = (row * 8) + seat

  if id > max_id
    max_id = id
  end
  puts "row: #{row} seat: #{seat} id: #{id}"
end

puts max_id 
