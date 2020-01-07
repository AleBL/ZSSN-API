FactoryBot.define do
  factory :person do
    name     { FFaker::NameBR.name }
    age      { FFaker::Random.rand(1..99) }
    gender   { FFaker::GenderBR.maybe }
    infected { false }
    local    { FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s }
  end

  factory :person_infected, class: 'Person' do
    name     { FFaker::NameBR.name }
    age      { FFaker::Random.rand(1..99) }
    gender   { FFaker::GenderBR.maybe }
    infected { true }
    local    { FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s }
  end

  factory :person_with_inventory, class: 'Person'do
    name         { FFaker::NameBR.name }
    age          { FFaker::Random.rand(1..99) }
    gender       { FFaker::GenderBR.maybe }
    infected     { false }
    local        { FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s }
    inventory_id { FactoryBot.create(:inventory_trade).id }
  end

  factory :person_infected_with_inventory, class: 'Person'do
    name         { FFaker::NameBR.name }
    age          { FFaker::Random.rand(1..99) }
    gender       { FFaker::GenderBR.maybe }
    infected     { false }
    local        { FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s }
    inventory_id { FactoryBot.create(:inventory_trade).id }
  end
  
end
