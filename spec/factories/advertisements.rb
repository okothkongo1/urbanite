FactoryBot.define do
  factory :advertisement do
    user
    location { 'Kisumu' }
    category { 'Electronic' }
    advert_type { 'Phone' }
    model { 'Samsung' }
    price { 10_000 }
  end
end
