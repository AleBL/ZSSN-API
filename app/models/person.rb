class Person < ApplicationRecord
  validates :name, presence: true
  validates :local, presence: true
  validates :inventory_id, presence: true
  
  belongs_to :inventory

  validate :check_local
  def check_local

    return errors.add(:local, I18n.t('person.location.invalid')) if local.nil?

    location = local.split(',');

    return errors.add(:local, I18n.t('person.location.invalid')) if location.length > 2
    return errors.add(:local, I18n.t('person.location.invalid')) if location[0].to_f == 0.0
    return errors.add(:local, I18n.t('person.location.invalid')) if location[1].to_f == 0.0
  end
end
