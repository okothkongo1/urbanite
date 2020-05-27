# frozen_string_literal: true
FactoryBot.define do
  factory :advertisement do
    user
    location { 'Kisumu' }
    category { 'Electronic' }
    advert_type { 'Phone' }
    model { 'Samsung' }
    price { 10_000 }
    factory :valid_advertisement, parent: :advertisement do
      after(:build) do |advertisement|
        3.times do
          advertisement.images.attach(io: File.open(Rails.root.join(
          'spec/support/assets/advertisements/galaxyj7star.jpg')),
          filename: 'galaxyj7star.jpg', content_type: 'image/jpg')
        end
      end
    end
  end
end

