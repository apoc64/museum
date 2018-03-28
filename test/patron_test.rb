
require_relative "../lib/patron"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"

class PatronTest < MiniTest::Test

  def test_it_exists
    patron = Patron.new("Bob")
    assert_instance_of Patron, patron
  end

  def test_it_has_a_name
    patron = Patron.new("Bob")
    assert_equal "Bob", patron.name
  end

  def test_it_starts_with_no_interests
    patron = Patron.new("Bob")
    assert_equal [], patron.interests
  end

  def test_it_can_add_interests
    bob = Patron.new("Bob")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    bob.interests
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end

end
