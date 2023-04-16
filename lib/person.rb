class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(person_details)
    @name       = person_details[:name]
    @interests  = person_details[:interests]
    @supplies   = {}
  end
end