require_relative "../lib/museum"
require_relative "../lib/patron"
require_relative "../lib/exhibit"
require 'pry'
require "Minitest/autorun"
require "Minitest/pride"

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

  def test_it_can_return_exhibits_by_attendees
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

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], dmns.exhibits_by_attendees
  end

  def test_it_can_remove_unpopular_exhibits
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


    dmns.remove_unpopular_exhibits(1)
    assert_equal ["Dead Sea Scrolls"], dmns.exhibits_by_attendees

  end

end
