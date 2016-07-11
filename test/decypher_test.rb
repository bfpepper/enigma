require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/decypher"

class DecryptTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Decypher, Decypher.new("2656", "49545")
  end

  def test_input_is_split_into_letters
    decypher = Decypher.new("2656", "49545")
    decypher.split_letters("Hello World")
    assert_equal decypher.letters, [["H", "o", "r"], ["e", " ", "l"], ["l", "W", "d"], ["l", "o"]]
  end

  def test_rotation_calculated
    decypher = Decypher.new("2656", "49545")
    assert_equal 65, decypher.calculate_rotation(1)
  end

  def test_dictionary_is_rotated
    decypher = Decypher.new("2656", "49545")
    decypher.split_letters("Hello World")
    decypher.create_rotate_dictionary
    assert_equal [{" "=>"Z", "!"=>"[", "\""=>"\\", "#"=>"]", "$"=>"^", "%"=>"_", "&"=>"`", "'"=>"a", "("=>"b", ")"=>"c", "*"=>"d", "+"=>"e", ","=>"f", "-"=>"g", "."=>"h", "/"=>"i", "0"=>"j", "1"=>"k", "2"=>"l", "3"=>"m", "4"=>"n", "5"=>"o", "6"=>"p", "7"=>"q", "8"=>"r", "9"=>"s", ":"=>"t", ";"=>"u", "<"=>"v", "="=>"w", ">"=>"x", "?"=>"y", "@"=>"z", "A"=>" ", "B"=>"!", "C"=>"\"", "D"=>"#", "E"=>"$", "F"=>"%", "G"=>"&", "H"=>"'", "I"=>"(", "J"=>")", "K"=>"*", "L"=>"+", "M"=>",", "N"=>"-", "O"=>".", "P"=>"/", "Q"=>"0", "R"=>"1", "S"=>"2", "T"=>"3", "U"=>"4", "V"=>"5", "W"=>"6", "X"=>"7", "Y"=>"8", "Z"=>"9", "["=>":", "\\"=>";", "]"=>"<", "^"=>"=", "_"=>">", "`"=>"?", "a"=>"@", "b"=>"A", "c"=>"B", "d"=>"C", "e"=>"D", "f"=>"E", "g"=>"F", "h"=>"G", "i"=>"H", "j"=>"I", "k"=>"J", "l"=>"K", "m"=>"L", "n"=>"M", "o"=>"N", "p"=>"O", "q"=>"P", "r"=>"Q", "s"=>"R", "t"=>"S", "u"=>"T", "v"=>"U", "w"=>"V", "x"=>"W", "y"=>"X", "z"=>"Y"}, {" "=>":", "!"=>";", "\""=>"<", "#"=>"=", "$"=>">", "%"=>"?", "&"=>"@", "'"=>"A", "("=>"B", ")"=>"C", "*"=>"D", "+"=>"E", ","=>"F", "-"=>"G", "."=>"H", "/"=>"I", "0"=>"J", "1"=>"K", "2"=>"L", "3"=>"M", "4"=>"N", "5"=>"O", "6"=>"P", "7"=>"Q", "8"=>"R", "9"=>"S", ":"=>"T", ";"=>"U", "<"=>"V", "="=>"W", ">"=>"X", "?"=>"Y", "@"=>"Z", "A"=>"[", "B"=>"\\", "C"=>"]", "D"=>"^", "E"=>"_", "F"=>"`", "G"=>"a", "H"=>"b", "I"=>"c", "J"=>"d", "K"=>"e", "L"=>"f", "M"=>"g", "N"=>"h", "O"=>"i", "P"=>"j", "Q"=>"k", "R"=>"l", "S"=>"m", "T"=>"n", "U"=>"o", "V"=>"p", "W"=>"q", "X"=>"r", "Y"=>"s", "Z"=>"t", "["=>"u", "\\"=>"v", "]"=>"w", "^"=>"x", "_"=>"y", "`"=>"z", "a"=>" ", "b"=>"!", "c"=>"\"", "d"=>"#", "e"=>"$", "f"=>"%", "g"=>"&", "h"=>"'", "i"=>"(", "j"=>")", "k"=>"*", "l"=>"+", "m"=>",", "n"=>"-", "o"=>".", "p"=>"/", "q"=>"0", "r"=>"1", "s"=>"2", "t"=>"3", "u"=>"4", "v"=>"5", "w"=>"6", "x"=>"7", "y"=>"8", "z"=>"9"}, {" "=>"A", "!"=>"B", "\""=>"C", "#"=>"D", "$"=>"E", "%"=>"F", "&"=>"G", "'"=>"H", "("=>"I", ")"=>"J", "*"=>"K", "+"=>"L", ","=>"M", "-"=>"N", "."=>"O", "/"=>"P", "0"=>"Q", "1"=>"R", "2"=>"S", "3"=>"T", "4"=>"U", "5"=>"V", "6"=>"W", "7"=>"X", "8"=>"Y", "9"=>"Z", ":"=>"[", ";"=>"\\", "<"=>"]", "="=>"^", ">"=>"_", "?"=>"`", "@"=>"a", "A"=>"b", "B"=>"c", "C"=>"d", "D"=>"e", "E"=>"f", "F"=>"g", "G"=>"h", "H"=>"i", "I"=>"j", "J"=>"k", "K"=>"l", "L"=>"m", "M"=>"n", "N"=>"o", "O"=>"p", "P"=>"q", "Q"=>"r", "R"=>"s", "S"=>"t", "T"=>"u", "U"=>"v", "V"=>"w", "W"=>"x", "X"=>"y", "Y"=>"z", "Z"=>" ", "["=>"!", "\\"=>"\"", "]"=>"#", "^"=>"$", "_"=>"%", "`"=>"&", "a"=>"'", "b"=>"(", "c"=>")", "d"=>"*", "e"=>"+", "f"=>",", "g"=>"-", "h"=>".", "i"=>"/", "j"=>"0", "k"=>"1", "l"=>"2", "m"=>"3", "n"=>"4", "o"=>"5", "p"=>"6", "q"=>"7", "r"=>"8", "s"=>"9", "t"=>":", "u"=>";", "v"=>"<", "w"=>"=", "x"=>">", "y"=>"?", "z"=>"@"}, {" "=>"p", "!"=>"q", "\""=>"r", "#"=>"s", "$"=>"t", "%"=>"u", "&"=>"v", "'"=>"w", "("=>"x", ")"=>"y", "*"=>"z", "+"=>" ", ","=>"!", "-"=>"\"", "."=>"#", "/"=>"$", "0"=>"%", "1"=>"&", "2"=>"'", "3"=>"(", "4"=>")", "5"=>"*", "6"=>"+", "7"=>",", "8"=>"-", "9"=>".", ":"=>"/", ";"=>"0", "<"=>"1", "="=>"2", ">"=>"3", "?"=>"4", "@"=>"5", "A"=>"6", "B"=>"7", "C"=>"8", "D"=>"9", "E"=>":", "F"=>";", "G"=>"<", "H"=>"=", "I"=>">", "J"=>"?", "K"=>"@", "L"=>"A", "M"=>"B", "N"=>"C", "O"=>"D", "P"=>"E", "Q"=>"F", "R"=>"G", "S"=>"H", "T"=>"I", "U"=>"J", "V"=>"K", "W"=>"L", "X"=>"M", "Y"=>"N", "Z"=>"O", "["=>"P", "\\"=>"Q", "]"=>"R", "^"=>"S", "_"=>"T", "`"=>"U", "a"=>"V", "b"=>"W", "c"=>"X", "d"=>"Y", "e"=>"Z", "f"=>"[", "g"=>"\\", "h"=>"]", "i"=>"^", "j"=>"_", "k"=>"`", "l"=>"a", "m"=>"b", "n"=>"c", "o"=>"d", "p"=>"e", "q"=>"f", "r"=>"g", "s"=>"h", "t"=>"i", "u"=>"j", "v"=>"k", "w"=>"l", "x"=>"m", "y"=>"n", "z"=>"o"}], decypher.rotated_dictionary
  end

  def test_swap_letters_in_rotated_dictionary
    decypher = Decypher.new("2656", "49545")
    decypher.split_letters("Hello World")
    decypher.create_rotate_dictionary
    decypher.swap_letters_with_rotated_dictionary
    assert_equal [["'", "N", "Q"], ["$", ":", "+"], ["2", "x", "*"], ["a", "d"]], decypher.encrypted_letters
  end

  def test_it_can_output_encrypted_text
    decypher = Decypher.new("2656", "49545")
    decypher.split_letters("Hello World")
    decypher.create_rotate_dictionary
    decypher.swap_letters_with_rotated_dictionary
    assert_equal "'$2aN:xdQ+*" , decypher.spit_out_encrypted_output
  end

  def test_it_all_works
    decypher = Decypher.new("2656", "49545")
    assert_equal "'$2aN:xdQ+*" , decypher.riddle("Hello World")
  end


end
