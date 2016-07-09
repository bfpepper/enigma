require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/crack"

class CrackTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Crack, Crack.new
  end


end
