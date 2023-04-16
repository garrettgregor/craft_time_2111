class Person
  attr_reader :name,
              :interests
  def initialize(person_details)
    @name       = person_details[:name]
    @interests  = person_details[:interests]
  end
end