count = 0
input = File.read("input.txt").split("\n\n")
input.map do |passport|
  passport.gsub!(/\n/, " ")
  if (passport.include?("byr:") && passport.include?("iyr:") && passport.include?("eyr:") && passport.include?("hgt:") &&
      passport.include?("hcl:") && passport.include?("ecl:") && passport.include?("pid:"))
    puts "VALID: #{passport}"
    count += 1 
  else
    puts "INVALID: #{passport}"
  end
end
puts "Total VALID: #{count}"
