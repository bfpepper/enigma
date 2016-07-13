require 'simplecov'
SimpleCov.start
require "minitest/autorun"
require "minitest/nyan_cat"
require "./lib/cracked"

class CrackedTest < Minitest::Test

  def test_it_works
    cracked = Cracked.new("pTII<YEI4MG;<OAD<ZOM<NEQ'aLB:gED$^YF5QDQ6_ID(gT>&gED*SM7<ML=0^IJ)Y[_JQN:Ju")
    assert_equal "This message can now be fully encrypted using the enigma algorithm ..end..", cracked.crack_it
  end

  def test_the_output_end_is_correct
    cracked = Cracked.new("nd..")
    assert_equal ["n", "d", ".", "."], cracked.output_end
  end

  def test_the_input_end_is_the_same
    cracked = Cracked.new("nd..")
    assert_equal ["n", "d", ".", "."], cracked.input_end
  end

  def test_output_marker
    cracked = Cracked.new("this thing")
    assert_equal "hing", cracked.output_marker
  end

  def test_output_marker_index
    cracked = Cracked.new("this thing")
    cracked.output_marker
    assert_equal 6, cracked.output_marker_index
  end

end
