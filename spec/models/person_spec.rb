require "rails_helper"

RSpec.describe Person, type: :model do
  context "Valid Person" do
    it "It is a valid person" do
      person    = build(:person)
      inventory = create(:inventory)
      person.inventory_id = inventory.id

      expect(person.valid?).to be_truthy
    end
  end

  context "Invalid Person" do
    it "It is not a valid person, person doesn`t have a inventory" do
      person = build(:person)

      expect(person.valid?).to be_falsy
    end
  end
end
