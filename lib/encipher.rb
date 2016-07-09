require "./lib/offsets"
require './lib/key'
require "pry"

class Encipher

  def initialize
    @offset = Offsets.new.generate_offset
    @key = Key.new.generate_key
    @supported_charecters = (' '..'z').to_a
    @a_letters = []
    @b_letters = []
    @c_letters = []
    @d_letters = []
  end

  def riddle(input)
    split_input = input.chars
    split_input.each_with_index do |letter, index|
      if index == 0
        @a_letters << letter
      end

      if index == 1
        @b_letters << letter
      end

      if index == 2
        @c_letters << letter
      end

      if index == 3
        @d_letters << letter
      end
    end
  end

  def a_rotation
    a_offset = @offset[0].to_i
    a_key = @key[0..1].to_i
    a_offset + a_key
  end

  def b_rotation
    b_offset = @offset[1].to_i
    b_key = @key[1..2].to_i
    b_offset + b_key
  end

  def c_rotation
    c_offset = @offset[2].to_i
    c_key = @key[2..3].to_i
    c_offset + c_key
  end

  def d_rotation
    d_offset = @offset[3].to_i
    d_key = @key[3..4].to_i
    d_offset + d_key
  end

  def a_rotated_charecters
    @supported_charecters.rotate(a_rotation).to_a
  end

  def b_rotated_charecters
    @supported_charecters.rotate(b_rotation).to_a
  end

  def c_rotated_charecters
    @supported_charecters.rotate(c_rotation).to_a
  end

  def d_rotated_charecters
    @supported_charecters.rotate(d_rotation).to_a
  end

  def a_pair
    a_paired_letters = @supported_charecters.zip(a_rotated_charecters)
    hash[a_paired_letters]
  end

  def b_pair
    b_paired_letters = @supported_charecters.zip(b_rotated_charecters)
    hash[b_paired_letters]
  end

  def c_pair
    c_paired_letters = @supported_charecters.zip(c_rotated_charecters)
    hash[c_paired_letters]
  end

  def d_pair
    d_paired_letters = @supported_charecters.zip(d_rotated_charecters)
    hash[d_paired_letters]
  end

end
