class Inventory < ApplicationRecord
  has_one :person, dependent: :destroy

  validates :water,       presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food,        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :medication,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ammunition,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
