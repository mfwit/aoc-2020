class Passport
  attr_reader :birth_year, :issue_year, :expiration_year, :height, :hair_color, :eye_color,
              :passport_id, :country_id

  def initialize(input_string)
    input = input_string.split(" ")
    input.each do |row|
      row_split = row.split(":")
      case row_split[0]
      when "byr"
        @birth_year = row_split[1].to_i
      when "iyr"
        @issue_year = row_split[1].to_i
      when "eyr"
        @expiration_year = row_split[1].to_i
      when "hgt"
        @height = row_split[1]
      when "hcl"
        @hair_color = row_split[1]
      when "ecl"
        @eye_color = row_split[1]
      when "pid"
        @passport_id = row_split[1]
      when "cid"
        @country_id = row_split[1]
      end
    end
  end

  def valid
    valid_birth_year = false
    valid_issue_year = false
    valid_expiration_year = false
    valid_height = false
    valid_hair_color = false
    valid_eye_color = false
    valid_passport_id = false

    ## Birth Year validation
    unless @birth_year.nil?
      if @birth_year >= 1920 && @birth_year <= 2002
        valid_birth_year = true
      end
    end
    ## Issue Year validation
    unless @issue_year.nil?
      if @issue_year >= 2010 && @issue_year <= 2020
        valid_issue_year = true
      end
    end
    ## Expiration Year validation
    unless @expiration_year.nil?
      if @expiration_year >= 2020 && @expiration_year <= 2030
        valid_expiration_year = true
      end
    end
    ## Height validation
    unless @height.nil?
      if @height.include? "cm"
        h = @height.delete("cm").to_i
        if h.to_i >= 150 && h.to_i <= 193
          valid_height = true
        end
      elsif @height.include? "in"
        h = @height.delete("in").to_i
        if h.to_i >= 59 && h.to_i <= 76
          valid_height = true
        end
      else
        valid_height = false
      end
    end
    ## Hair color validation
    unless @hair_color.nil?
      if @hair_color.match?(/#[a-f|0-9]{6}$/)
        valid_hair_color = true
      end
    end
    ## Eye color validation
    unless @eye_color.nil?
      if ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include? @eye_color
        valid_eye_color = true
      end
    end
    ## Passport validation
    unless @passport_id.nil?
      if @passport_id.match?(/\A[\d]{9}/)
        valid_passport_id = true
      end
    end

    if valid_birth_year && valid_issue_year && valid_expiration_year && valid_height && valid_hair_color && valid_eye_color && valid_passport_id
      return true
    else
      return false
    end
  end
end

count = 0
input = File.read("input.txt").split("\n\n")
input.map do |passport|
  passport.gsub!(/\n/, " ")
  p = Passport.new(passport)
  puts "#{p.valid} || Birth Year: #{p.birth_year} Issue Year: #{p.issue_year} Expiration Year: #{p.expiration_year} Height: #{p.height} Hair Color: #{p.hair_color} Eye Color: #{p.eye_color} Passport ID: #{p.passport_id}"
  if p.valid
    count += 1
  end
end
puts "Total VALID: #{count}"