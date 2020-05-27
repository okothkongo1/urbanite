# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advert){create(:advertisement)}
  it 'should have valid Factory' do
    expect(create(:valid_advertisement)).to be_valid
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
    it { is_expected.to validate_attached_of(:images) }
    it {
      is_expected.to validate_content_type_of(:images).allowing(
        'image/png', 'image/jpeg', 'image/jpg')
    }
  end
  describe 'user association' do
    it { is_expected.to belong_to(:user) }
  end
  describe '#advert creation' do
    let(:length_error) {['is too long (maximum is 20 characters)']}
    it 'should create advert with valid attributes' do
      advert = create(:valid_advertisement)
      expect(advert).to be_valid
      expect(advert.location).to eq 'Kisumu'
    end
    it 'it should not allow advert without location to be created' do
      advertisement = build(:valid_advertisement, location: '')
      advertisement.save
      expect(advertisement.errors.messages[:location]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long location to be created' do
      advertisement = build(:valid_advertisement, location: 'Kingston' * 4)
      advertisement.save
      expect(advertisement.errors.messages[:location]).to eq length_error
    end
    it 'it should not allow advert without category to be created' do
      advertisement = build(:valid_advertisement, category: '')
      advertisement.save
      expect(advertisement.errors.messages[:category]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long category to be created' do
      advertisement = build(:valid_advertisement, category: 'Electronics' * 4)
      advertisement.save
      expect(advertisement.errors.messages[:category]).to eq length_error
    end
    it 'it should not allow advert without advert_type to be created' do
      advertisement = build(:valid_advertisement, advert_type: '')
      advertisement.save
      expect(advertisement.errors.messages[:advert_type]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with long advert_type to be created' do
      advertisement = build(:valid_advertisement, advert_type: 'Computer' * 4)
      advertisement.save
      expect(advertisement.errors.messages[:advert_type]).to eq length_error
    end
    it 'it should not allow advert without price to be created' do
      advertisement = build(:valid_advertisement, price: '')
      advertisement.save
      expect(advertisement.errors.messages[:price]).to eq ["can't be blank"]
    end
    it 'it should not allow advert with non integer price to be created' do
      advertisement = build(:valid_advertisement, price: 'a1')
      advertisement.save
      expect(advertisement.errors.messages[:price]).to eq ['is not a number']
    end
    it 'it should not allow advert with not allowed content type to created' do
      advertisement = build(:valid_advertisement)
      advertisement.images.attach(io: File.open(
        Rails.root.join('spec/support/assets/advertisements/dummy.pdf')),
        filename: 'dummy.pdf', content_type: 'image/pdf')
      advertisement.save
      expect(advertisement).to_not be_valid
      expect(advertisement.errors.messages[:images]).to_not be_blank
    end
    it 'it should not allow advert with less three images to be saved' do
      advertisement = build(:advertisement)
      advertisement.images.attach(io: File.open(
        Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg')),
        filename: 'galaxyj7star.jpg', content_type: 'image/jpg')
      advertisement.save
      expect(advertisement).to_not be_valid
      expect(advertisement.errors.messages[:images]).to_not be_blank
    end
    it 'it should not allow advert with more 5 images to be saved ' do
      advertisement = build(:advertisement)
      6.times do
        advertisement.images.attach(io: File.open(
          Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg')),
          filename: 'galaxyj7star.jpg', content_type: 'image/jpg')
      end
      advertisement.save
      expect(advertisement).to_not be_valid
      expect(advertisement.errors.messages[:images]).to_not be_blank
    end
  end
end