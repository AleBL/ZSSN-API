require 'rails_helper'

RSpec.describe TradeValidator do
  describe "trade validator" do
    let(:person_to)      { build(:person) }
    let(:inventory_to)   { create(:inventory_trade) }
    let(:person_from)    { build(:person) }
    let(:inventory_from) { create(:inventory_trade) }

    context "#valid? true" do
      it "trade is valid" do
        person_to.inventory_id = inventory_to.id
        person_to.save

        person_from.inventory_id = inventory_from.id
        person_from.save

        trade_validator = TradeValidator.new(inventory_from: inventory_from, inventory_to: inventory_to)
        expect(trade_validator.valid?).to be_truthy
      end
    end

    context "#valid? false" do
      it "trade is invalid, person_to infected" do
        person_to.inventory_id = inventory_to.id
        person_to.infected = true
        person_to.save

        person_from.inventory_id = inventory_from.id
        person_from.save

        trade_validator = TradeValidator.new(inventory_from: inventory_from, inventory_to: inventory_to)
        expect(trade_validator.valid?).to be_falsey
      end

      it "trade is invalid, person_from infected" do
        person_to.inventory_id = inventory_to.id
        person_to.save

        person_from.inventory_id = inventory_from.id
        person_from.infected = true
        person_from.save

        trade_validator = TradeValidator.new(inventory_from: inventory_from, inventory_to: inventory_to)
        expect(trade_validator.valid?).to be_falsey
      end
    end
  end
end
