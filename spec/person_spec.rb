require "spec_helper"

RSpec.describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ["sewing", "millinery", "drawing"]})
  end
  
  describe "#initialize" do
    it "exists and has attributes" do
      expect(@person).to be_a Person
      expect(@person.name).to eq("Hector")
      expect(@person.interests).to be_an Array
      expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
    end
  end
end