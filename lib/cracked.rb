require './lib/decypher'
require 'pry'

class Cracked
  attr_reader :output, :rotations, :supported_characters

  def initialize(output)
    @supported_characters = (' '..'z').to_a
    @rotations = []
    @output = output
  end

  def crack_it
    find_index(output_marker_index, @rotations)
    decypher = Decypher.new(nil, nil, @rotations)
    decypher.split_letters(output)
    decypher.create_rotate_dictionary
    decypher.swap_letters_with_rotated_dictionary
    decypher.spit_out_decrypted_output
  end

  def output_end
    output[-4..-1].split("")
  end

  def input_end
    "nd..".split("")
  end

  def output_marker
    output[-4..-1]
  end

  def output_marker_index
    output.index(output_marker)
  end

  def find_index(index, rotations)
    output_end.zip(input_end).each do |output_letter, input_letter|
      output_index = supported_characters.index(output_letter)
      input_index = supported_characters.index(input_letter)
      rotation_number = output_index - input_index
      if rotation_number < 0
        rotation_number += 91
      else
        rotation_number
      end
      those(index, rotations, rotation_number)
      index += 1
    end
  end


  def those(index, rotations, rotation_number)
    if index % 4 == 0

      rotations[0] = rotation_number
    elsif index % 4 == 1
      rotations[1] = rotation_number
    elsif index % 4 == 2
      rotations[2] = rotation_number
    else
      rotations[3] = rotation_number
    end
  end

end
