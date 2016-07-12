require './lib/decypher'
require 'pry'

class Cracked
  attr_reader :output, :rotations

    def initialize
      @supported_characters = (' '..'z').to_a
      @rotations = []
    end

    def crack_it(output)
      @output = output
      find_index
      decypher = Decypher.new(nil, nil, @rotations)
      decypher.split_letters(@output)
      decypher.create_rotate_dictionary
      decypher.swap_letters_with_rotated_dictionary
      decypher.spit_out_encrypted_output
    end



    def find_index
      output_end = @output[-4..-1].split("")
      input_end  = "nd..".split("")
      output_marker = @output[-4..-1]
      output_marker_index = @output.index(output_marker)

      output_end.zip(input_end).each do |output_letter, input_letter|
        output_index = @supported_characters.index(output_letter)
        input_index = @supported_characters.index(input_letter)
        rotation_number = output_index - input_index
        if rotation_number < 0
          rotation_number += 91
        else
          rotation_number
        end
        if output_marker_index % 4 == 0
          @rotations[0] = rotation_number
        elsif output_marker_index % 4 == 1
          @rotations[1] = rotation_number
        elsif output_marker_index % 4 == 2
          @rotations[2] = rotation_number
        else
          @rotations[3] = rotation_number
        end
        output_marker_index += 1
      end
    end
end
