class Person < ApplicationRecord
  GEOCOORDINATES_REGEX = /\A-?\d+\.\d+,\s*-?\d+\.\d+\z/.freeze

  validates :name, presence: true
  validates :local, presence: true

  belongs_to :inventory

  validate :check_local

  def check_local
    return errors.add(:local, I18n.t('person.location.invalid')) unless valid_geocoordinates?(local)

    lat, long = local.split(',').map(&:strip).map(&:to_f)

    valid_latitude = lat.between?(-90, 90)
    valid_longitude = long.between?(-180, 180)

    return unless !valid_latitude || !valid_longitude

    errors.add(:local, I18n.t('person.location.invalid'))
  end

  private

  def valid_geocoordinates?(coordinates)
    GEOCOORDINATES_REGEX.match?(coordinates)
  end
end
