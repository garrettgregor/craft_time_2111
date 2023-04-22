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

  def can_build?(craft)
    if supplies == {} || (supply_objects != craft.supplies_required.keys.sort)
      false
    elsif supply_objects == craft.supplies_required.keys.sort
      true
    end
  end

  def supply_objects
    @supplies.keys.map do |supply|
      supply.to_sym
    end.sort
  end

end