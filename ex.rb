require "pry"

# supported_charecters = (' '..'z').to_a
# numbers_supported =

 letter_cypher = {"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6,
                  "g"=>7, "h"=>8, "i"=>9, "j"=>10, "k"=>11, "l"=>12,
                  "m"=>13, "n"=>14, "o"=>15, "p"=>16, "q"=>17, "r"=>18,
                  "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23,"x"=>24,
                  "y"=>25, "z"=>26}

key = "12345"

rotation_a = key[0..1]
rotation_b = key[1..2]
rotation_c = key[2..3]
rotation_d = key[3..4]

input = "rock"

# gets numerical values
split_input = input.chars
num_value_letters = split_input.map {|letter| letter_cypher[letter]}

# rotates the numerical values
rotatated_values = num_value_letters.map.with_index do |number, index|
  if index == 0
    number = number + rotation_a.to_i
  end

  if index == 1
    number = number + rotation_b.to_i
  end

  if index == 2
    number = number + rotation_c.to_i
  end

  if index == 3
    number = number + rotation_d.to_i
  end

  number
end

puts rotatated_values

# How to make it into a method eventually...
# def rotations(key)
#   rotation_a = key[0..1]
#   rotation_b = key[1..2]
#   rotation_c = key[2..3]
#   rotation_d = key[3..4]
#
#   [rot_a, rot_b, rot_c, rot_d]
# end

# rotations(key) => [rot_a, rot_b, rot_c, rot_d]
