# Iteration 1 - Museum
require_relative "../lib/museum"
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

# > dmns.add_exhibit("Dead Sea Scrolls", 10)
# > dmns.add_exhibit("Gems and Minerals", 0)
# Iteration 2 - Admitting Patrons and Revenue
# Museums can admit Patrons. When a Patron is admitted, the Museum gets 10 dollars for general admittance plus revenue for each exhibit the Patron is interested in. Some Patrons have interests for which there is no exhibit, and thus no revenue is generated. Follow this interaction pattern:
#
# > dmns = Museum.new("Denver Museum of Nature and Science")
# > dmns.add_exhibit("Dead Sea Scrolls", 10)
# > dmns.add_exhibit("Gems and Minerals", 0)
# >
# > bob = Patron.new("Bob")
# > bob.add_interest("Gems and Minerals")
# > bob.add_interest("Dead Sea Scrolls")
# > bob.add_interest("Imax")
# >
# > sally = Patron.new("Sally")
# > sally.add_interest("Dead Sea Scrolls")
# >
# > dmns.revenue
# #=> 0
# > dmns.admit(bob)
# > dmns.admit(sally)
# > dmns.revenue
# #=> 40
# Iteration 3 - Exhibit Tracking
# Add the following methods to your Museum class:
#
# patrons_of(exhibit) - this method returns an array of the names of all patrons of an exhibit.
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