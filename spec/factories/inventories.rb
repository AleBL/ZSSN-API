FactoryBot.define do
  factory :inventory do
    water      { FFaker::Random.rand(0..99) }
    food       { FFaker::Random.rand(0..99) }
    medication { FFaker::Random.rand(0..99) }
    ammunition { FFaker::Random.rand(0..99) }
  end
end
