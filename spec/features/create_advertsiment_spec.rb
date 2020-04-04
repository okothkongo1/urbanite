require 'rails_helper'

RSpec.describe 'Creating Advertisment', type: :feature do
  scenario 'valid inputs' do
    user = FactoryBot.create(:user)
    login_as user
    visit "/user/#{user.id}/advertisements/new"
    fill_in 'Location', with: 'Kisumu'
    fill_in 'Category', with: 'Electronic'
    fill_in 'Advert type', with: 'Computer'
    fill_in 'Model', with: 'Dell-XXX'
    click_on 'Create Advert'
  end
end