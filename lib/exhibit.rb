class Exhibit
  attr_reader :name,
              :cost

  attr_accessor :patrons

  def initialize(name, cost = 0)
    @name = name
    @cost = cost
    @patrons = []
  end

end
