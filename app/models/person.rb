class Person < ApplicationRecord
  validates :name, presence: true
  validates :inventory_id, presence: true
end
