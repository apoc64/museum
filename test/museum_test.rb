# Iteration 1 - Museum
require_relative "../lib/museum"
require_relative "../lib/patron"
require_relative "../lib/exhibit"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"
# A Museum has a name and exhibits. Each exhibit has a cost. A Museum starts with no exhibits, but exhibits can be added. When we add an exhibit, we must specify the exhibit name and the exhibit cost. Museums should follow this interaction pattern:
class MuseumTest < MiniTest::Test

  def test_it_exists
    museum = Museum.new("dmns")
    assert_instance_of Museum, museum
  end

  def test_it_has_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    assert_equal 2, dmns.exhibits.count
  end

  def test_it_can_admit_patrons_and_generate_revenue
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")

    assert_equal 0, dmns.revenue

    dmns.admit(bob)
    assert_equal 20, dmns.revenue
    dmns.admit(sally)
    assert_equal 40, dmns.revenue
  end

  # Iteration 3 - Exhibit Tracking
  # Add the following methods to your Museum class:
  #
  def test_it_can_return_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")
    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal [bob, sally], dmns.patrons_of("Dead Sea Scrolls")
    assert_equal [bob], dmns.patrons_of("Gems and Minerals")
end
#
# exhibits_by_attendees - this method returns an array of exhibits sorted from most patrons to least patrons.
#
# remove_unpopular_exhibits(threshold) - this method will remove any exhibit where the number of patrons who attended it is less than the threshold.
end
#
# Iteration 4 - The Runner
# Build a runner file that simulates interactions with a single museum. A user should be able to interface with our code through the command line in the following manner:
#
# At startup, the program will ask the user for the name of the museum
# The user can press 'e' to add an exhibit to the museum
# The user can press 'a' to admit a new patron to the museum
# The user can press 'r' to see the total revenue generated
# The user can press 't' to see the top exhibits
# The user can press 'u' to remove unpopular exhibits
# The user can press 'q' to exit the program
