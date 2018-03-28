# require_relative "../lib/museum"
# require_relative "../lib/patron"
require_relative "../lib/exhibit"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"

class ExhibitTest < MiniTest::Test

  def test_it_exists
    ex = Exhibit.new("gems", 0)
    assert_instance_of Exhibit, ex
  end

  def test_it_has_a_name_and_cost
    ex = Exhibit.new("gems", 10)
    assert_equal "gems", ex.name
    assert_equal 10, ex.cost
  end

  def tests_it_can_have_patrons
    ex = Exhibit.new("gems", 10)
    bob = Patron.new("Bob")
    sally = Patron.new("Sally")
    ex.patrons << bob
    ex.patrons << sally
    assert_equal [bob, sally], ex.patrons
    assert_equal 2, ex.patrons.count
    assert_equal "Bob", ex.patrons[0].name
  end

  # Iteration 3 - Exhibit Tracking
  # Add the following methods to your Museum class:
  #
  # patrons_of(exhibit) - this method returns an array of the names of all patrons of an exhibit.
  #
  # exhibits_by_attendees - this method returns an array of exhibits sorted from most patrons to least patrons.
  #
  # remove_unpopular_exhibits(threshold) - this method will remove any exhibit where the number of patrons who attended it is less than the threshold.

end
