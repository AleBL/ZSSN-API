50.times do
  person = FactoryBot.create(:person_with_inventory)
end

10.times do
  person = FactoryBot.create(:person_infected_with_inventory)
end
