require "./lib/offsets"
require './lib/key'
require "pry"

class Encipher

  def initialize
    @offset = Offsets.new.generate_offset #offset ||
    @key = Key.new.generate_key #key ||
    @supported_characters = (' '..'z').to_a
    # @letters = [[],[],[],[]] same as how we do it below
    @letters = {"0": [], "1": [], "2": [], "3": []}
    @rotated_dictionary = []
    @encrypted_letters = []
  end

  def riddle(input)
    split_letters(input)
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

  def spit_out_encrypted_output
      @encrypted_letters[0].zip(*@encrypted_letters[1..-1]).flatten.compact.join("")
  end

  def swap_letters_with_rotated_dictionary
    @letters.each do |key, value|
      value.each do |letter|
        @encrypted_letters[key] << @rotated_dictionary[key][letter] # "j", "k"
      end
    end
  end

  def create_rotate_dictionary
    @letters.each do |key, value|
      rotation_amount = calculate_rotation(key)
      rotated_support_chars = rotate_support_chars(rotation_amount)
      @rotated_dictionary[key] = rotate_dictionary(rotated_support_chars)
    end
  end

  def calculate_rotation(position)
    offset = @offset[position].to_i
    key = @key[position..position+1].to_i
    offset + key
  end

  def rotate_support_chars(rotation_amount)
    @supported_characters.rotate(rotation_amount).to_a
  end

  def rotate_dictionary(rotated_support_chars)
    @supported_characters.zip(rotated_support_chars).to_h
  end


end
