 
require 'rails_helper'
 
RSpec.describe 'Creating ', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'
    user = User.find_by(email: 'o@o.com')
    visit "#{user.id}"
    expect(page).to have_content('Jane')
  end
  scenario 'empty email input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("Email can't be blank")
  end
  scenario 'invalid email format' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content('Email format is invalid')
  end
  scenario 'empty email input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("Email can't be blank")
  end
  scenario 'empty first name input' do
    visit new_user_path
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("First name can't be blank")
    expect(page).not_to have_content('First name format is invalid')
  end
  scenario 'invalid first name input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane1'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content('First name format is invalid')
  end
  scenario 'empty last name input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'
    expect(page).not_to have_content('Last name format is invalid')
    expect(page).to have_content("Last name can't be blank")
  end
  scenario 'invalid last name input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane1'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jane@doe1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content('Last name format is invalid')
  end
  scenario 'empty password input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: ''
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("Password can't be blank")
    expect(page).not_to have_content('Password too weak')
  end
  scenario 'weak password input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'Jwertyoo'
    fill_in 'Password Confirmation', with: 'Jwertytoo'
    click_on 'Create User'    
    expect(page).to have_content('Password is too weak')  
  end
  scenario 'blank password input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: ''
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("Password can't be blank") 
  end
  scenario 'umatching password input' do
    visit new_user_path
    fill_in 'First Name', with: 'Jane'
    fill_in 'Last Name', with: 'Jane'
    fill_in 'Email', with: 'o@o.com'
    fill_in 'Password', with: 'JwertyQ!!1'
    fill_in 'Password Confirmation', with: 'Jane@doe1'
    click_on 'Create User'    
    expect(page).to have_content("Password confirmation doesn't match Password")  
  end
end