require "spec_helper"

RSpec.describe Person do
  describe "#initialize" do
    it "starts with name, interests and supplies" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person).to be_a(Person)
      expect(person.name).to eq("Hector")
      expect(person.interests).to eq(["sewing", "millinery", "drawing"])
      expect(person.supplies).to eq({})
    end
  end
end