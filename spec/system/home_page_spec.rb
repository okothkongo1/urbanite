# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'HomePage', type: :feature do

  it 'shows adverts on the homepage' do
    visit root_path
    expect(page).to have_selector('.material-icons')
  end
end
