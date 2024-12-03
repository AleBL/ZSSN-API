require 'rails_helper'

RSpec.describe Person do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:local) }

    it { is_expected.to belong_to(:inventory) }
  end

  context 'when the person is valid' do
    let(:person) { build(:person_with_inventory) }

    it 'is a valid person' do
      expect(person).to be_valid
    end
  end

  context 'when the person is invalid' do
    let(:person) { build(:person_with_inventory) }

    it 'is not a valid person, person doesn`t have an inventory' do
      person.inventory = nil
      expect(person).not_to be_valid
    end

    it 'is not a valid person, longitude is not valid' do
      person.local = "#{FFaker::Lorem.sentence}, #{FFaker::Geolocation.lng}"
      expect(person).not_to be_valid
    end

    it 'is not a valid person, latitude is not valid' do
      person.local = "#{FFaker::Geolocation.lat}, #{FFaker::Lorem.sentence}"
      expect(person).not_to be_valid
    end

    it 'is not a valid person, latitude does not exist' do
      person.local = "#{FFaker::Random.rand(100..160.0)}, #{FFaker::Geolocation.lng}"
      expect(person).not_to be_valid
    end

    it 'is not a valid person, longitude does not exist' do
      person.local = "#{FFaker::Geolocation.lat}, #{FFaker::Random.rand(200..260.0)}"
      expect(person).not_to be_valid
    end
  end
end
