require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/cracked"

class CrackedTest < Minitest::Test

  def test_an_instance_is_created
    assert_instance_of Cracked, Cracked.new
  end


end
