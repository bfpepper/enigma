require "./lib/offsets"
require './lib/key'
require 'digest'
require "pry"

class Encipher
  attr_reader :key, :letters, :offset, :encrypted_letters, :rotated_dictionary

  def initialize(offest=nil, key=nil)
    @offset = offset || Offsets.new.generate_offset
    @key = key || Key.new.generate_key
    @supported_characters = (' '..'z').to_a
    @letters = [[],[],[],[]]
    @rotated_dictionary = [[],[],[],[]]
    @encrypted_letters = [[],[],[],[]]
  end

  def riddle(input)
    split_letters(input)
    create_rotate_dictionary
    swap_letters_with_rotated_dictionary
    spit_out_encrypted_output + create_last_four_of_sha
  end

  def create_last_four_of_sha
    sha = create_sha
    sha[-4..-1].to_s
  end

  def create_sha
    encryptd_text = spit_out_encrypted_output
    Digest::SHA256.hexdigest(encryptd_text)
  end

  def split_letters(input)
    split_input = input.chars
    split_input.each_with_index do |letter, index|
      @letters[index % 4] << letter
    end
  end

  def create_rotate_dictionary
    @letters.each_with_index do |value, index|
      rotation_amount = calculate_rotation(index)
      rotated_support_chars = rotate_support_chars(rotation_amount)
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
