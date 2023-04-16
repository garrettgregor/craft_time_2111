class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(person_details)
    @name       = person_details[:name]
    @interests  = person_details[:interests]
    @supplies   = Hash.new(0)
  end

  def add_supply(supply, number)
    @supplies[supply] += number
  end
end