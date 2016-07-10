require "./lib/encipher"

class Encrypt

  input_file = ARGV[0]
  output_file = ARGV[1]

  encipher = Encipher.new

  input = File.read(input_file)

  enciphered_text = encipher.riddle(input)
  File.write(output_file, enciphered_text)

  puts "Created '#{output_file}' with the key #{encipher.key} and date #{Time.now.strftime("%d%m%y").to_i}"

end
