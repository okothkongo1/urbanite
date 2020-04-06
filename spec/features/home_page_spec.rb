require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  scenario 'User not in session' do  
    visit root_path
    expect(page).to have_content "Home"
    expect(page).to have_content "About Us"
    expect(page).to have_content "Contact Us" 
    expect(page).to have_content "Account"
    expect(page).to have_content "Account Setting"
    expect(page).to have_content "Advert"
    expect(page).to have_content "SignUp/Login"
    click_link('Advert')
    expect(page).to have_content "Login"
    expect(page).to have_content "Sign up"
    expect(page).not_to have_content "Logout"
  end
  scenario 'User in session' do  
    user = FactoryBot.create(:user)
    login_as user
    visit root_path
    expect(page).to have_content "Home"
    expect(page).to have_content "About Us"
    expect(page).to have_content "Contact Us" 
    expect(page).to have_content  "Hi,#{user.first_name}"
    expect(page).to have_content "Account Setting"
    expect(page).to have_content "Advert"
    expect(page).to have_content "Logout"
    expect(page).not_to have_content "SignUp/Login"
  end
  scenario 'User in session without advert clicks Advert' do  
    user = FactoryBot.create(:user)
    login_as user
    visit root_path
    click_link('Advert')
    expect(page).to have_content user.first_name
    expect(page).to have_content "No adverts"
  end
  scenario 'User in session clicks Logout' do  
    user = FactoryBot.create(:user)
    login_as user
    visit root_path
    click_link('Logout')
    expect(page).to have_content "Account"
    expect(page).to have_content "SignUp/Login"  
  end
  scenario 'User in session with advert clicks Adverts' do  
    advert = FactoryBot.create(:advertisement)  
    user = User.find_by(id: advert.user_id)   
     login_as  user
    visit root_path
    click_link('Advert')
    expect(page).to have_content "Category"
    expect(page).to have_content  advert.category
    expect(page).not_to have_content "No adverts"
  end
end