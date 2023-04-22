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
end