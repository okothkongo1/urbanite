require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  let(:user){create(:user)}
 
  scenario 'user not logged in ' do
    visit users_path
    expect(current_path).to eq  root_path
  end
  scenario 'user logged in  but not admin' do
    login_as user
    visit users_path
    expect(current_path).to eq  root_path 
  end
  scenario 'user logged as admin' do
    user.role.name = 'admin'
    login_as user
    visit users_path
    expect(current_path).to eq  users_path 
  end
end