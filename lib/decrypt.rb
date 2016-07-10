require "./lib/decypher"

class Decrypt

  input_file = ARGV[0]
  output_file = ARGV[1]

  decypher = Decypher.new

  input = File.read(input_file)

  enciphered_text = decypher.riddle(input)
  File.write(output_file, enciphered_text)

  puts "Created '#{output_file}' with the key #{decypher.key} and date #{Time.now.strftime("%d%m%y").to_i}"

end
