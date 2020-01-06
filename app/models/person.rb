class Person < ApplicationRecord
  validates :name, presence: true
  validates :local, presence: true
  validates :inventory_id, presence: true

  validate :check_local
  def check_local
    location = local.split(',');

    errors.add(:local, "location is invalid") if location.length > 2
    errors.add(:local, "location is invalid") if location[0].to_f == 0.0
    errors.add(:local, "location is invalid") if location[1].to_f == 0.0
  end
end
