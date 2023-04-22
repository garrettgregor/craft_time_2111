class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(details)
    @name       = details[:name]
    @interests  = details[:interests]
    @supplies   = Hash.new(0)
  end
end