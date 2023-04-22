require "spec_helper"

RSpec.describe Craft do
  describe "#initialize" do
    it "starts with name and supplies required" do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft).to be_a(Craft)
      expect(craft.name).to eq("knitting")
      expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
    end
  end
end