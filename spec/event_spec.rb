require "spec_helper"

RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ["sewing", "millinery", "drawing"]})
    @craft = Craft.new("knitting", {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end
  
  describe "#initialize" do
    it "exists and has attributes" do
      expect(@event).to be_a Event
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@craft])
      expect(@event.attendees).to eq([@person])
    end
  end

  describe "#attendee_names" do
    it "returns a list of the attendees names" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      
      expect(event.attendee_names).to eq(["Hector", "Toni"])
    end
  end
  
  describe "#craft_with_most_supplies" do
    it "returns the craft that requires the most supply types" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      #<Person:0x00007fc419b97910...>
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      #<Person:0x00007fc3fa01e558...>
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      #<Craft:0x00007fc40901d5b8...>
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      #<Craft:0x00007fc419b4c2f8...>
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      #=> #<Event:0x00007fc3fa828780...>
      expect(event.craft_with_most_supplies).to eq("sewing")
      #=> "sewing"
      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
      #=> ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
    end
  end
  
  describe "#can_build?" do
    it "determines whether a person can build a particular craft" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      
      hector.can_build?(sewing)
      expect(hector.can_build?(sewing)).to be false
      
      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      
      expect(hector.can_build?(sewing)).to be false
      
      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.can_build?(sewing)).to be true
    end
  end
end