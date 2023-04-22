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

  def attendees_by_craft_interest
    attendees_by_craft_interest = {}
    crafts.each do |craft|
      attendees_by_craft_interest[craft.name] = []
    end
    attendees_by_craft_interest.each do |craft_name, arr|
      attendees.each do |attendee|
        if attendee.interests.include?(craft_name)
          attendees_by_craft_interest[craft_name] << attendee
        end
      end
    end
  end

  def crafts_that_use(supply)
    crafts_that_use = []
    supply_sym = supply.to_sym
    crafts.each do |craft|
      if craft.supplies_required.key?(supply_sym)
        crafts_that_use << craft
      end
    end
    crafts_that_use
  end

end