require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:advertisement)).to be_valid
  end
  describe '#advertisments table' do
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :advert_type }
    it { is_expected.to have_db_column :model }
    it { is_expected.to have_db_column :price }
  end
  describe '#validate advertisement attributes' do
    it { is_expected.to validate_presence_of(:location) }
    it { should validate_length_of(:location).is_at_most(20) }
    it { is_expected.to validate_presence_of(:category) }
    it { should validate_length_of(:category).is_at_most(20) }
    it { is_expected.to validate_presence_of(:advert_type) }
    it { should validate_length_of(:advert_type).is_at_most(20) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end
  describe 'user association' do
    it { is_expected.to belong_to(:user) }
  end
  describe '#advert creation' do
    it 'should create advert with valid attributes' do
      advert = FactoryBot.create(:advertisement)
      expect(advert).to be_valid
      expect(advert.location).to eq 'Kisumu'
    end
    it 'it should not allow advert without location to be created' do
      advertisement = FactoryBot.build(:advertisement, location: '')
      advertisement.save
      expect(advertisement.errors.messages[:location]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long location to be created' do
      advertisement = FactoryBot.build(:advertisement, location: 'Kingston'*4)
      advertisement.save
      expect(advertisement.errors.messages[:location]).to eq ['is too long (maximum is 20 characters)']
    end
    it 'it should not allow advert without category to be created' do
      advertisement = FactoryBot.build(:advertisement, category: '')
      advertisement.save
      expect(advertisement.errors.messages[:category]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long category to be created' do
      advertisement = FactoryBot.build(:advertisement, category: 'Electronics'*4)
      advertisement.save
      expect(advertisement.errors.messages[:category]).to eq ['is too long (maximum is 20 characters)']
    end
    it 'it should not allow advert without advert_type to be created' do
      advertisement = FactoryBot.build(:advertisement, advert_type: '')
      advertisement.save
      expect(advertisement.errors.messages[:advert_type]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long advert_type to be created' do
      advertisement = FactoryBot.build(:advertisement, advert_type: 'Computer'*4)
      advertisement.save
      expect(advertisement.errors.messages[:advert_type]).to eq ['is too long (maximum is 20 characters)']
    end
    it 'it should not allow advert without price to be created' do
      advertisement = FactoryBot.build(:advertisement, price: '')
      advertisement.save
      expect(advertisement.errors.messages[:price]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with non integer price to be created' do
      advertisement = FactoryBot.build(:advertisement, price: 'a1')
      advertisement.save
      expect(advertisement.errors.messages[:price]).to eq ['is not a number']
    end
  end
end