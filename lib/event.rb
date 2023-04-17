class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, crafts, attendees)
    @name         = name
    @crafts       = crafts
    @attendees    = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def supply_list
    all_supplies = []
    @crafts.each do |craft|
      craft.supplies_required.each do |supply|
        all_supplies << supply[0].to_s
      end
    end
    all_supplies.uniq
  end
  
  def craft_with_most_supplies
    craft_supply_count = Hash.new(0)
    @crafts.max_by do |craft|
      craft_supply_count[craft.name] += craft.supplies_required.length
    end
    craft_supply_count.key(craft_supply_count.values.max)
  end

end