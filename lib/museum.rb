

class Museum
  attr_reader :name,
              :exhibits,
              :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    # {} #{"name" => cost}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    # @exhibits[name] = cost
    exhibit = Exhibit.new(name, cost)
    exhibits << exhibit
  end

  def admit(patron)
    @revenue += 10
    patron.interests.each do |interest|
      exhibit = @exhibits.find { |exhibit| exhibit.name == interest }
      if !exhibit.nil?
        exhibit.patrons << patron
        @revenue += exhibit.cost
      end
    end
  end

  def patrons_of(exhibit_name)
    exhibit = @exhibits.find { |exhibit| exhibit.name == exhibit_name }
    exhibit.patrons
  end

end
