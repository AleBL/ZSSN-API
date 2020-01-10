require "rails_helper"

RSpec.describe Person, type: :model do
  context "Valid Person" do
    let(:person) { create(:person_with_inventory) }
    it "It is a valid person" do
      expect(person.valid?).to be_truthy
    end
  end

  context "Invalid Person" do
    let(:person) { create(:person_with_inventory) }
    
    it "It is not a valid person, person doesn`t have an inventory" do
      person.inventory_id = nil
      expect(person.valid?).to be_falsy
    end

    it "It is not a valid person, latitude is not valid" do
      person.local = FFaker::Geolocation.lat.to_s + ", " + FFaker::Lorem.sentence
      expect(person.valid?).to be_falsy
    end

    it "It is not a valid person, longitude is not valid" do
      person.local =  FFaker::Lorem.sentence + ", " + FFaker::Geolocation.lng.to_s
      expect(person.valid?).to be_falsy
    end
  end
end
