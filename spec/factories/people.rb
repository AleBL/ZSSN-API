FactoryBot.define do
  factory :person do
    name   { FFaker::NameBR.name }
    age    { FFaker::Random.rand(1..99) }
    gender { FFaker::GenderBR.maybe }
    local  { FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s }
  end
end
