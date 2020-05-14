require 'rails_helper'

RSpec.describe 'HomePage', type: :feature do

  it 'shows adverts on the homepage' do
    visit root_path
    expect(page).to have_content 'Available Adverts'
  end
end