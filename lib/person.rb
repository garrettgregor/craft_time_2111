class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(details)
    @name       = details[:name]
    @interests  = details[:interests]
    @supplies   = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end
end