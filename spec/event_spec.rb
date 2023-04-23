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

  describe "#attendees_by_craft_interest" do
    it "returns all crafts and attendees who are interested" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

      expected = {
        "knitting"=>[toni, tony],
        "painting"=>[],
        "sewing"=>[hector, toni]
      }

      expect(event.attendees_by_craft_interest).to eq(expected)
    end
  end

  describe "#crafts_that_use" do
    it "returns a list of crafts that use supply" do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

      expect(event.crafts_that_use("scissors")).to eq([knitting, sewing])
      expect(event.crafts_that_use("fire")).to eq([])
    end
  end

  describe "#assign_attendees_to_crafts" do
    it "randomly assigns people who are interested and have the right supplies" do
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      toni.add_supply('yarn', 30)
      toni.add_supply('scissors', 2)
      toni.add_supply('knitting_needles', 5)
      toni.add_supply('fabric', 10)
      toni.add_supply('scissors', 1)
      toni.add_supply('thread', 2)
      toni.add_supply('paint_brush', 10)
      toni.add_supply('paints', 20)

      tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
      tony.add_supply('yarn', 20)
      tony.add_supply('scissors', 2)
      tony.add_supply('knitting_needles', 2)

      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
      hector.add_supply('fabric', 5)
      hector.add_supply('scissors', 1)
      hector.add_supply('thread', 1)
      hector.add_supply('canvas', 5)
      hector.add_supply('paint_brush', 10)
      hector.add_supply('paints', 20)

      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
      allow(event).to_receive(:sample).and_return([])
      expect(event.assign_attendees_to_crafts).to eq(
          {
            knitting => [],
            sewing => [],
            painting => []
          }
        )
      # #=> {#<Craft:0x00007fae4d2a6fb8...>=>[#<Person:0x00007fae4d9526f0...>],
      #     #<Craft:0x00007fae2f84b950...>=>[#<Person:0x00007fae4d91ac00...>],
      #     #<Craft:0x00007fae2f032930...>=>[#<Person:0x00007fae2f018490...>]}

      # event.assign_attendees_to_crafts
      # #=> {#<Craft:0x00007fae4d2a6fb8...>=>[#<Person:0x00007fae4d9526f0...>],
      # #<Craft:0x00007fae2f84b950...>=>[],
      # #<Craft:0x00007fae2f032930...>=>[#<Person:0x00007fae4d91ac00...>,#<Person:0x00007fae2f018490...>]}
    end
  end
end