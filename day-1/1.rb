input = File.readlines("input.txt")
input.each do |line|
  input.each do |line2|
    sum = line.to_i + line2.to_i
    if (sum == 2020)
      puts "#{line.to_i * line2.to_i}"
    end
  end
end