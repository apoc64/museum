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

  def exhibits_by_attendees
    sorted = exhibits.sort_by { |exhibit| exhibit.patrons.count }
    sorted.map do |exhibit|
      exhibit.name
    end.reverse
  end

  def remove_unpopular_exhibits(threshold)
    # exhibits_to_remove = []
    @exhibits.each do |exhibit|
      if exhibit.patrons.count <= threshold
        @exhibits.delete(exhibit)
      end
    end
  end

end
