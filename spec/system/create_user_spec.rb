 
require 'rails_helper'
 
RSpec.describe 'Creating ', type: :feature  do 
  before(:each) do
    create(:role)
    visit new_user_registration_path
  end
  scenario 'valid inputs' do 
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'janedoe@yahoo.com'
    fill_in 'user_password', with: 'FalseDate2!'
    fill_in 'user_password_confirmation', with: 'FalseDate2!'
    click_on 'Sign up'
    expect(page).to have_selector('.notice', text: 'A message with a confirmation link has'\
                                            ' been sent to your email address.'\
                                            ' Please follow the link to activate your account.')
  end
  scenario 'empty email input' do
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content("can't be blank")
  end
  scenario 'invalid email format' do
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content('is invalid')
  end

  scenario 'empty first name input' do
    # user_reg_path
    fill_in 'user_first_name', with: ''
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content("can't be blank")
  end
  scenario 'invalid first name input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane1'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content('is invalid')
  end
  scenario 'empty last name input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: ''
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content("can't be blank")
  end
  scenario 'invalid last name input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane1'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'Jane@doe1'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content('is invalid')
  end
  scenario 'empty password input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content("can't be blank") 
  end
  scenario 'weak password input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'je@j'
    fill_in 'user_password', with: 'rrrrrrrrrrrrrrrrr'
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content 'Atleast 8 characters, 1 lower-case,'\
                                  '1 upcase,1 symbol and a digit'
  end
  scenario 'blank password input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: 'Jane@doe1'
    click_on 'Sign up'  
    expect(page).to have_content("can't be blank") 
  end
  scenario 'umatching password input' do
    # user_reg_path
    fill_in 'user_first_name', with: 'Jane'
    fill_in 'user_last_name', with: 'Jane'
    fill_in 'user_email', with: 'jane@example.com'
    fill_in 'user_password', with: 'WereQWerty'
    fill_in 'user_password_confirmation', with: 'yueWQrr'
    click_on 'Sign up'  
    expect(page).to have_content("doesn't match Password") 
  end
end