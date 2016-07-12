require "./lib/cracked"

class Crack

  input_file = ARGV[0]
  output_file = ARGV[1]
  date = ARGV[2]

  cracked = Cracked.new

  input = File.read(input_file)

  cracked_text = cracked.crack_it(input)
  File.write(output_file, cracked_text)
  
  # key = Cracked.new.rotations

  # puts "Created '#{output_file}' with the key need to figure out the key thign and date #{date}"

end
