require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/decypher"

class DecryptTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Decypher, Decypher.new
  end


end
