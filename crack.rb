require 'pry'

class Crack
  def initialize(output) # output = "'$2aN:xdQ+*phH+cCHO" => "Hello World ..end.."
    @output = output
    @supported_characters = (' '..'z').to_a
    @rotations = [[], [], [], []]
  end

  def find_index
    output_end = @output[-4..-1].split("")
    input_end  = "nd..".split("")
    output_marker = @output[-4..-1]
    output_marker_index = @output.index(output_marker)
    
    output_end.zip(input_end).each do |output_letter, input_letter|
      output_index = @supported_characters.index(output_letter) 
      input_index = @supported_characters.index(input_letter) 
      rotation_number = input_index - output_index
      if rotation_number < 0 
        rotation_number += 91
      else
        rotation_number
      end
      if output_marker_index % 4 == 0
        @rotations[0] << rotation_number
      elsif output_marker_index % 4 == 1
        @rotations[1] << rotation_number
      elsif output_marker_index % 4 == 2
        @rotations[2] << rotation_number
      else
        @rotations[3] << rotation_number
      end
      output_marker_index += 1
    end
  end
  
  def find_index_of_end
    output_marker = @output[-4..-1]
    output_marker_index = @output.index(output_marker)
    output_marker.split("").each do |letter|
      if output_marker_index % 4 == 0
        @rotations[0] << letter 
      elsif output_marker_index % 4 == 1
        @rotations[1] << letter
      elsif output_marker_index % 4 == 2
        @rotations[2] << letter 
      else
        @rotations[3] << letter
      end
      output_marker_index += 1
    end
    binding.pry
  end
  
  def decrypt
    decrypt = []
    @output.split("").each_with_index do |letter, index|
      if index % 4 == 0
        decrypt << @supported_characters(letter).rotate(@rotations[0].join.to_i)
      elsif index % 4 == 1
        decrypt << @supported_characters(letter).rotate(@rotations[1].join.to_i)
      elsif index % 4 == 2
        decrypt << @supported_characters(letter).rotate(@rotations[2].join.to_i)
      else 
        decrypt << @supported_characters(letter).rotate(@rotations[3].join.to_i)
      end
    end.join
    binding.pry
  end
  
end

crack = Crack.new("'$2aN:xdQ+*phH+cCHO")
crack.find_index
crack.decrypt 
 
