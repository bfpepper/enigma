class Decypher
  attr_reader :key, :letters, :offset, :encrypted_letters, :rotated_dictionary, :rotations

  def initialize(key = nil, date = nil, rotations = [])
    @offset = (date.to_i ** 2).to_s[-4..-1]
    @key = key
    @supported_characters = (' '..'z').to_a
    @letters = [[],[],[],[]]
    @rotated_dictionary = [[],[],[],[]]
    @encrypted_letters = [[],[],[],[]]
    @rotations = rotations
  end

  def riddle(input)
    split_letters(input)
    calculate_rotation
    create_rotate_dictionary
    swap_letters_with_rotated_dictionary
    spit_out_encrypted_output
  end

  def split_letters(input)
    split_input = input.chars
    split_input.each_with_index do |letter, index|
      @letters[index % 4] << letter
    end
  end

  def create_rotate_dictionary
    @letters.each_with_index do |value, index|
      # rotation_amount = calculate_rotation(index)
      thing = @rotations[index]
      # binding.pry
      rotated_support_chars = rotate_support_chars(-thing)
      @rotated_dictionary[index] = rotate_dictionary(rotated_support_chars)
    end
  end

  def spit_out_encrypted_output
      @encrypted_letters[0].zip(*@encrypted_letters[1..-1]).flatten.compact.join("")
  end

  def swap_letters_with_rotated_dictionary
    @letters.each_with_index do |value, index|
      value.each do |letter|
        @encrypted_letters[index] << @rotated_dictionary[index][letter]
      end
    end
  end

  def calculate_rotation
    # num_position = position.to_s.to_i
    # @rotations = []
    4.times do | index |
      key = @key[index..index+1].to_i
      offset = @offset[index].to_i
      value = offset + key
      @rotations[index] = offset + key
    end 
  end

  def rotate_support_chars(rotation_amount)
    @supported_characters.rotate(rotation_amount).to_a
  end

  def rotate_dictionary(rotated_support_chars)
    @supported_characters.zip(rotated_support_chars).to_h
  end

end
