require "spec_helper"

RSpec.describe Event do
  describe "#initialize" do
    it "starts with name, crafts and attendees" do
      person1 = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft1 = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [craft1], [person1])

      expect(event).to be_a(Event)
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft1])
      expect(event.attendees).to eq([person1])
    end
  end

  describe "#attendee names" do
    it "list names of attendees" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.attendee_names).to eq(["Hector", "Toni"])
    end
  end

  describe "#craft_with_most_supplies" do
    it "returns the craft that has the most supplies" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.craft_with_most_supplies).to eq("sewing")
    end
  end

  describe "#supply_list" do
    it "returns a list of the supplies at event" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]

      expect(event.supply_list).to eq(expected)
    end
  end

  describe "#can_build?" do
    it "checks whether a person has requisite supplies needed for craft" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)

      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end