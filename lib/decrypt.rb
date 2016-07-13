require "pry"
require 'digest'
require "./lib/decypher"

class Decrypt


  def split_input_from_sha(input)
    message = input[0..-5]
    sha = input[-4..-1]
    check_sha_authenticity(message, sha)
  end

  def check_sha_authenticity(message, sha)
    binding.pry
    new_sha = Digest::SHA256.hexdigest(message)
    last_four = new_sha[-4..-1]
    if last_four == sha
      "valid"
    else
      "not valid"
    end
  end

end

input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

decypher = Decypher.new(key, date)

input = File.read(input_file)

enciphered_text = decypher.unriddle(input)
File.write(output_file, enciphered_text)

d = Decrypt.new
puts "Created '#{output_file}' with the key #{decypher.key} and date #{date}. This message's authenticity was #{d.split_input_from_sha(input)}"
