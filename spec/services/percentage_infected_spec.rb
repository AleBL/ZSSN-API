require "rails_helper"

RSpec.describe PercentageInfected do
  describe "average resources" do
    let(:percentage_infected) { PercentageInfected.new }
    let(:people_infected)     { Person.where(infected: true) }

    context "valid attributes" do
      it "expected percentage people infected" do
        percentage = percentage_infected.percentage
        result_spec = ((people_infected.count/Person.count.to_f) * 100).round(2)

        expect(percentage).to eq(result_spec)
      end
    end

    context "invalid attributes" do
      it "unexpected percentage people infected" do
        percentage = percentage_infected.percentage
        result_spec = ((people_infected.count/Person.count.to_f) * 100) + 1

        expect(percentage).to_not eq(result_spec)
      end
    end
  end
end