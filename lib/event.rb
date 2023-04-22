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
end