# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

100.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      password: 'VeryStrong@123',
      password_confirmation:'VeryStrong@123',
      confirmed_at: Time.current
  )
end

Advertisement.destroy_all
user_ids = User.all.map{|u| u.id} * 4

user_ids.map{ |user_id| Advertisement.create user_id: user_id, category: 'Electronic',  advert_type: 'Phone' ,
                                              price: Faker::Number.between(from: 1, to: 1000000),
                                              location: Faker::Address.city, model: Faker::Appliance.brand }
