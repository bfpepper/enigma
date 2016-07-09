require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/encrypt"

class EncryptTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Encrypt, Encrypt.new
  end

end
