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
      expect(@person.supplies).to be_a Hash
      expect(@person.supplies).to eq({})
    end
  end
  
  describe "#add_supply" do
    it "adds a supply to the person" do
      expect(@person.supplies).to be_a Hash
      expect(@person.supplies).to eq({})
      
      @person.add_supply('fabric', 4)
      
      expected = {
        "fabric"=>4
      }
      
      expect(@person.supplies).to eq(expected)
    end
    
    it "can add multiple supplies to the person" do
      expect(@person.supplies).to be_a Hash
      expect(@person.supplies).to eq({})
      @person.add_supply('fabric', 4)
      
      @person.add_supply('scissors', 1)
      
      expected = {
        "fabric"=>4,
        "scissors"=>1
      }

      expect(@person.supplies).to eq(expected)
    end
   
    it "can add multiple of the same supplies to the person" do
      expect(@person.supplies).to be_a Hash
      expect(@person.supplies).to eq({})
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      @person.add_supply('fabric', 3)
      
      expected = {
        "fabric"=>7,
        "scissors"=>1
      }

      expect(@person.supplies).to eq(expected)
    end
  end
end