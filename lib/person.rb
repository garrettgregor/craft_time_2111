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

  def can_build?(craft)
    # check = []
    # supplies_strings = craft.supplies_required.transform_keys{|key| key.to_s}
    # check = supplies_strings.map do |supply_string|
    #   supply_string.include?
    # end
    # check = @supplies.map do |supply|
    #   supplies_strings.include?(supply)
    # end

    # check.any?(false)
    # @supplies.each do |supply, value|
    #   craft.supplies_required.keys.each do |key|
    #     supply == key.to_s
    #   end
    #   # .to_s == supply
    # end
    # @supplies.each do |supply|
      # check << supply.first.to_sym
    # end

    # if craft.supplies_required.keys == check
    #   true
    # else
    #   false
    # end
    # all of the keys that sewing has should be what person has
  end
end