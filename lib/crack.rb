require "pry"
require "./lib/cracked"

class Crack

  def self.run
    input_file = ARGV[0]
    output_file = ARGV[1]
    date = ARGV[2]

    @date = (date.to_i ** 2).to_s[-4..-1]

    input = File.read(input_file)
    @cracked = Cracked.new(input)

    cracked_text = @cracked.crack_it
    File.write(output_file, cracked_text)

    puts "Created '#{output_file}' with the key #{find_key} and date #{date}"
  end

  private

    def self.find_key
      rotations = @cracked.rotations
      a = rotations[0] - @date[0].to_i
      c = rotations[2] - @date[2].to_i
      d = rotations[3] - @date[3].to_i
      key = a.to_s + c.to_s + d.to_s[1]
      key
    end
end

Crack.run
