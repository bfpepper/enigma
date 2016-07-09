require "pry"

# supported_charecters = (' '..'z').to_a
# rotated_charecters = supported_charecters.rotate

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

# sets all four rotations
# offset_a = offset[0].to_i + key[0..1].to_i
# => 70
# offset_b = offset[1].to_i + key[1..2].to_i
# => 90
# offset_c = offset[2].to_i + key[2..3].to_i
# => 53
# offset_d = offset[3].to_i + key[3..4].to_i
# => 88

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


#takes four arrays, zips together, flattens to one array, and joins.
                          #array_a.zip(array_b).zip(array_c).zip(array_d).flatten.join("")
# array_a = (1..5).to_a
# => [1, 2, 3, 4, 5]
# array_b = (6..10).to_a
# => [6, 7, 8, 9, 10]
# array_c = (11..15).to_a
# => [11, 12, 13, 14, 15]
# array_d = (16..20).to_a
# => [16, 17, 18, 19, 20]
# array_a.zip(array_b).zip(array_c).zip(array_d)
# => [[[[1, 6], 11], 16], [[[2, 7], 12], 17], [[[3, 8], 13], 18], [[[4, 9], 14], 19], [[[5, 10], 15], 20]]
# array_a.zip(array_b).zip(array_c).zip(array_d).flatten
# => [1, 6, 11, 16, 2, 7, 12, 17, 3, 8, 13, 18, 4, 9, 14, 19, 5, 10, 15, 20]
# word = "rock".chars
# => ["r", "o", "c", "k"]
# r = ["r"]
# => ["r"]
# r
# => ["r"]
# [r.class
# => Array
# [o = ["o"]
# => ["o"]
# [c = ["c"]
# => ["c"]
# [k = ["k"]
# => ["k"]
# [r.zip(o).zip(c).zip(k)
# => [[[["r", "o"], "c"], "k"]]
# [r.zip(o).zip(c).zip(k).flatten
# => ["r", "o", "c", "k"]
# [r.zip(o).zip(c).zip(k).flatten.join("")
# => "rock"

# thing.map.with_index do |number, index|
#    if index == 0
#      a_array << number
#    end
#    if index == 1
#      b_array << number
#    end
#    if index == 2
#      c_array << number
#    end
#    if index == 3
#      d_array << number
#    end
#  end
#
#  thing.each_slice(4) do |element|
#    a_array << element[0]
#    b_array << element[1]
#    c_array << element[2]
#    d_array << element[3]
#    exit
