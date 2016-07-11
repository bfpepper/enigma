require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/encipher"
require "pry"

class EncipherTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Encipher, Encipher.new("2656", "49545")
  end

  def test_input_is_split_into_letters
    encipher = Encipher.new("2656", "49545")
    encipher.split_letters("Hello World")
    assert_equal encipher.letters, [["H", "o", "r"], ["e", " ", "l"], ["l", "W", "d"], ["l", "o"]]
  end

  def test_rotation_calculated
    encipher = Encipher.new("2656", "49545")
    assert_equal 101, encipher.calculate_rotation(1)
  end

  def test_dictionary_is_rotated
    encipher = Encipher.new("2656", "49545")
    encipher.split_letters("Hello World")
    encipher.create_rotate_dictionary
    assert_equal [{" "=>"S", "!"=>"T", "\""=>"U", "#"=>"V", "$"=>"W", "%"=>"X", "&"=>"Y", "'"=>"Z", "("=>"[", ")"=>"\\", "*"=>"]", "+"=>"^", ","=>"_", "-"=>"`", "."=>"a", "/"=>"b", "0"=>"c", "1"=>"d", "2"=>"e", "3"=>"f", "4"=>"g", "5"=>"h", "6"=>"i", "7"=>"j", "8"=>"k", "9"=>"l", ":"=>"m", ";"=>"n", "<"=>"o", "="=>"p", ">"=>"q", "?"=>"r", "@"=>"s", "A"=>"t", "B"=>"u", "C"=>"v", "D"=>"w", "E"=>"x", "F"=>"y", "G"=>"z", "H"=>" ", "I"=>"!", "J"=>"\"", "K"=>"#", "L"=>"$", "M"=>"%", "N"=>"&", "O"=>"'", "P"=>"(", "Q"=>")", "R"=>"*", "S"=>"+", "T"=>",", "U"=>"-", "V"=>".", "W"=>"/", "X"=>"0", "Y"=>"1", "Z"=>"2", "["=>"3", "\\"=>"4", "]"=>"5", "^"=>"6", "_"=>"7", "`"=>"8", "a"=>"9", "b"=>":", "c"=>";", "d"=>"<", "e"=>"=", "f"=>">", "g"=>"?", "h"=>"@", "i"=>"A", "j"=>"B", "k"=>"C", "l"=>"D", "m"=>"E", "n"=>"F", "o"=>"G", "p"=>"H", "q"=>"I", "r"=>"J", "s"=>"K", "t"=>"L", "u"=>"M", "v"=>"N", "w"=>"O", "x"=>"P", "y"=>"Q", "z"=>"R"}, {" "=>"*", "!"=>"+", "\""=>",", "#"=>"-", "$"=>".", "%"=>"/", "&"=>"0", "'"=>"1", "("=>"2", ")"=>"3", "*"=>"4", "+"=>"5", ","=>"6", "-"=>"7", "."=>"8", "/"=>"9", "0"=>":", "1"=>";", "2"=>"<", "3"=>"=", "4"=>">", "5"=>"?", "6"=>"@", "7"=>"A", "8"=>"B", "9"=>"C", ":"=>"D", ";"=>"E", "<"=>"F", "="=>"G", ">"=>"H", "?"=>"I", "@"=>"J", "A"=>"K", "B"=>"L", "C"=>"M", "D"=>"N", "E"=>"O", "F"=>"P", "G"=>"Q", "H"=>"R", "I"=>"S", "J"=>"T", "K"=>"U", "L"=>"V", "M"=>"W", "N"=>"X", "O"=>"Y", "P"=>"Z", "Q"=>"[", "R"=>"\\", "S"=>"]", "T"=>"^", "U"=>"_", "V"=>"`", "W"=>"a", "X"=>"b", "Y"=>"c", "Z"=>"d", "["=>"e", "\\"=>"f", "]"=>"g", "^"=>"h", "_"=>"i", "`"=>"j", "a"=>"k", "b"=>"l", "c"=>"m", "d"=>"n", "e"=>"o", "f"=>"p", "g"=>"q", "h"=>"r", "i"=>"s", "j"=>"t", "k"=>"u", "l"=>"v", "m"=>"w", "n"=>"x", "o"=>"y", "p"=>"z", "q"=>" ", "r"=>"!", "s"=>"\"", "t"=>"#", "u"=>"$", "v"=>"%", "w"=>"&", "x"=>"'", "y"=>"(", "z"=>")"}, {" "=>"[", "!"=>"\\", "\""=>"]", "#"=>"^", "$"=>"_", "%"=>"`", "&"=>"a", "'"=>"b", "("=>"c", ")"=>"d", "*"=>"e", "+"=>"f", ","=>"g", "-"=>"h", "."=>"i", "/"=>"j", "0"=>"k", "1"=>"l", "2"=>"m", "3"=>"n", "4"=>"o", "5"=>"p", "6"=>"q", "7"=>"r", "8"=>"s", "9"=>"t", ":"=>"u", ";"=>"v", "<"=>"w", "="=>"x", ">"=>"y", "?"=>"z", "@"=>" ", "A"=>"!", "B"=>"\"", "C"=>"#", "D"=>"$", "E"=>"%", "F"=>"&", "G"=>"'", "H"=>"(", "I"=>")", "J"=>"*", "K"=>"+", "L"=>",", "M"=>"-", "N"=>".", "O"=>"/", "P"=>"0", "Q"=>"1", "R"=>"2", "S"=>"3", "T"=>"4", "U"=>"5", "V"=>"6", "W"=>"7", "X"=>"8", "Y"=>"9", "Z"=>":", "["=>";", "\\"=>"<", "]"=>"=", "^"=>">", "_"=>"?", "`"=>"@", "a"=>"A", "b"=>"B", "c"=>"C", "d"=>"D", "e"=>"E", "f"=>"F", "g"=>"G", "h"=>"H", "i"=>"I", "j"=>"J", "k"=>"K", "l"=>"L", "m"=>"M", "n"=>"N", "o"=>"O", "p"=>"P", "q"=>"Q", "r"=>"R", "s"=>"S", "t"=>"T", "u"=>"U", "v"=>"V", "w"=>"W", "x"=>"X", "y"=>"Y", "z"=>"Z"}, {" "=>"S", "!"=>"T", "\""=>"U", "#"=>"V", "$"=>"W", "%"=>"X", "&"=>"Y", "'"=>"Z", "("=>"[", ")"=>"\\", "*"=>"]", "+"=>"^", ","=>"_", "-"=>"`", "."=>"a", "/"=>"b", "0"=>"c", "1"=>"d", "2"=>"e", "3"=>"f", "4"=>"g", "5"=>"h", "6"=>"i", "7"=>"j", "8"=>"k", "9"=>"l", ":"=>"m", ";"=>"n", "<"=>"o", "="=>"p", ">"=>"q", "?"=>"r", "@"=>"s", "A"=>"t", "B"=>"u", "C"=>"v", "D"=>"w", "E"=>"x", "F"=>"y", "G"=>"z", "H"=>" ", "I"=>"!", "J"=>"\"", "K"=>"#", "L"=>"$", "M"=>"%", "N"=>"&", "O"=>"'", "P"=>"(", "Q"=>")", "R"=>"*", "S"=>"+", "T"=>",", "U"=>"-", "V"=>".", "W"=>"/", "X"=>"0", "Y"=>"1", "Z"=>"2", "["=>"3", "\\"=>"4", "]"=>"5", "^"=>"6", "_"=>"7", "`"=>"8", "a"=>"9", "b"=>":", "c"=>";", "d"=>"<", "e"=>"=", "f"=>">", "g"=>"?", "h"=>"@", "i"=>"A", "j"=>"B", "k"=>"C", "l"=>"D", "m"=>"E", "n"=>"F", "o"=>"G", "p"=>"H", "q"=>"I", "r"=>"J", "s"=>"K", "t"=>"L", "u"=>"M", "v"=>"N", "w"=>"O", "x"=>"P", "y"=>"Q", "z"=>"R"}], encipher.rotated_dictionary
  end

  def test_swap_letters_in_rotated_dictionary
    encipher = Encipher.new("2656", "49545")
    encipher.split_letters("Hello World")
    encipher.create_rotate_dictionary
    encipher.swap_letters_with_rotated_dictionary
    assert_equal [[" ", "G", "J"], ["o", "*", "v"], ["L", "7", "D"], ["D", "G"]], encipher.encrypted_letters
  end

  def test_it_can_output_encrypted_text
    encipher = Encipher.new("2656", "49545")
    encipher.split_letters("Hello World")
    encipher.create_rotate_dictionary
    encipher.swap_letters_with_rotated_dictionary
    assert_equal " oLDG*7GJvD" , encipher.spit_out_encrypted_output
  end

  def test_it_all_works
    encipher = Encipher.new("2656", "49545")
    assert_equal " oLDG*7GJvD" , encipher.riddle("Hello World")
  end

  def test_the_key_is_random
    results = []
    5.times{ results << Encipher.new.key }
    assert results.uniq.count > 1
  end

end
