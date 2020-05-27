# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Login  ', type: :feature do
  before(:each) do
    FactoryBot.create(:user, email: 'janedoe@example.com')
  end
  scenario 'valid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'janedoe@example.com'
    fill_in 'Password', with: 'Verystrong.123'
    click_on 'Log in'
    visit root_path
    expect(page).to have_content('Jane')
  end
  scenario 'empty email input' do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'Verystrong.123'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
  scenario 'invalid email input' do
    visit new_user_session_path
    fill_in 'Email', with: 'strong@arm.com'
    fill_in 'Password', with: 'Verystrong.123'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
  scenario 'empty password input' do
    visit new_user_session_path
    fill_in 'Email', with: 'jane@example.com'
    fill_in 'Password', with: ''
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
  scenario 'invalid password input' do
    visit new_user_session_path
    fill_in 'Email', with: 'janedoe@example.com'
    fill_in 'Password', with: 'Verystrong.1'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end