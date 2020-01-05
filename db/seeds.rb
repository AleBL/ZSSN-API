50.times do
  inventory = Inventory.create(
    water:      FFaker::Random.rand(0..99),
    food:       FFaker::Random.rand(0..99),
    medication: FFaker::Random.rand(0..99),
    ammunition: FFaker::Random.rand(0..99)
  )

  if inventory.persisted?
      person = Person.create(
        name:     FFaker::NameBR.name,
        age:      FFaker::Random.rand(1..99),
        gender:   FFaker::GenderBR.maybe,
        local:    FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s,
        infected: false,
        inventory_id: inventory.id
      )
  end
end
