require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  let(:user){create(:user)}
  let(:admin) {create(:admin)}
  scenario 'user not logged in ' do
    visit admin_users_path
    expect(current_path).to eq  root_path
  end
  scenario 'user logged in  but not admin' do
    login_as user
    visit admin_users_path
    expect(current_path).to eq  root_path 
  end
  scenario 'user logged as admin' do
    user
    login_as admin
    visit admin_users_path
    expect(page).to  have_content 'Jane'
  end
end