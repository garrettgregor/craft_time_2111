require "spec_helper"

RSpec.describe Craft do
  before(:each) do
    @craft = Craft.new("knitting", {yarn: 20, scissors: 1, knitting_needles: 2})
  end
  
  describe "#initialize" do
    it "exists and has attributes" do
      expect(@craft).to be_a Craft
      expect(@craft.name).to eq("knitting")

      expected = {
        yarn: 20,
        scissors: 1, 
        knitting_needles: 2
      }

      expect(@craft.supplies_required).to eq(expected)
    end
  end
end