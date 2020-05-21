# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
puts 'all existing users deleted'
  n = 0
100.times do

  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      password: 'VeryStrong@123',
      password_confirmation:'VeryStrong@123',
      confirmed_at: Time.current
  )
  puts "creating user number #{n+=1}"
end

Advertisement.destroy_all
puts 'all adverts deleted'
user_ids = User.all.map{|u| u.id} * 2


 number = 0
user_ids.each do |user_id|
   advertisement = Advertisement.new(user_id: user_id, category: 'Electronic',  advert_type: 'Phone' ,
                                          price: Faker::Number.between(from: 1, to: 1000000),
                                          location: Faker::Address.city, model: Faker::Appliance.brand)
  3.times do
    advertisement.images.attach(io: File.open(Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg')), filename: 'advert.jpeg')
  end
 
  advertisement.save



puts "creating advert number #{number+=1}"
end


User.create(
  first_name: 'Jane',
  last_name: 'Doe',
  email: 'admin@urbanite.org',
  password: 'SuperSecret@123',
  role: :admin,
  password_confirmation: 'SuperSecret@123',
   confirmed_at: Time.current
)
puts 'admin has been created'