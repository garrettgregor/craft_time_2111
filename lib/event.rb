class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts = [], attendees = [])
    @name       = name
    @crafts     = crafts
    @attendees  = attendees
  end

  def attendee_names
    attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft_with_most_supplies = @crafts.max_by do |craft|
      craft.supplies_required.count
    end
    craft_with_most_supplies.name
  end

  def supply_list
    supply_list = []
    crafts.each do |craft|
      craft.supplies_required.each do |supply, amount|
        supply_list << supply.to_s
      end
    end
    supply_list.uniq
  end
end