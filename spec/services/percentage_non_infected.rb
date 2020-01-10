require "rails_helper"

RSpec.describe PercentageNonInfected do
  describe "average resources" do
    let(:percentage_non_infected) { PercentageNonInfected.new }
    let(:people_non_infected)     { Person.where(infected: false) }

    context "valid attributes" do
      it "expected percentage people infected" do
        percentage = percentage_non_infected.percentage
        result_spec = (people_non_infected.count/Person.count) * 100

        expect(percentage).to eq(result_spec)
      end
    end

    context "invalid attributes" do
      it "unexpected percentage people infected" do
        percentage = percentage_non_infected.percentage
        result_spec = ((people_non_infected.count/Person.count.to_f) * 100) + 1

        expect(percentage).to_not eq(result_spec)
      end
    end
  end
end