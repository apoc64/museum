
class Museum
  attr_reader :name,
              :exhibits,
              :revenue

  def initialize(name)
    @name = name
    @exhibits = {} #{"name" => cost}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name] = cost
  end

  def admit(patron)
    @revenue += 10
    #emun patron interests
    patron.interests.each do |interest|
      #if they equal museum exhibit names
      if @exhibits.include?(interest)
        @revenue += @exhibits[interest]
      end
      #add cost of exhibit to revenue
    end
  end

end
