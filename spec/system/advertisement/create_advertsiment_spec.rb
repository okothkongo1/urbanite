require 'rails_helper'

RSpec.describe 'Creating Advertisment', type: :feature do
  let(:user){create(:user)}
  before(:each) do
    login_as user
    visit new_advertisement_path
  end
  scenario 'successful advert creation' do
    fill_in 'advertisement_location', with: 'Kisumu'
    fill_in 'advertisement_category', with: 'Electronic'
    fill_in 'advertisement_advert_type', with: 'Computer'
    fill_in 'advertisement_model', with: 'Dell-XXX'
    fill_in 'advertisement_price', with: '10'
    attach_file 'advertisement_images',
                [Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
                 Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
                 Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg')]
    click_on 'Post Advert'
    expect(page).to have_content 'Kisumu'
  end
  scenario 'blank location' do
    fill_in 'advertisement_location', with: ''
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_location', text: "can't be blank")
  end
  scenario 'blank category' do
    fill_in 'advertisement_category', with: ''
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_category', text: "can't be blank")
  end
  scenario 'blank advert type' do
    fill_in 'advertisement_advert_type', with: ''
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_advert_type', text: "can't be blank")
  end
  scenario 'blank price' do
    fill_in 'advertisement_price', with: ''
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_price', text: "can't be blank")
  end
  scenario 'non digit  price' do
    fill_in 'Price', with: '1a'
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_price', text: 'is not a number')
  end
  scenario 'user upload less than three images' do
    attach_file 'advertisement_images',
                Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg')
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_images',
                                  text: 'upload atleast 3 and at most 5 images')
  end
  scenario 'user upload less than three images' do
    attach_file 'advertisement_images',
              [Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
              Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
              Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
              Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
              Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg'),
              Rails.root.join('spec/support/assets/advertisements/galaxyj7star.jpg') ]
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_images',
                                  text: 'upload atleast 3 and at most 5 images')
  end
  scenario 'user uploads image with invalid format' do
    attach_file 'advertisement_images',
                Rails.root.join('spec/support/assets/advertisements/dummy.pdf')
    click_on 'Post Advert'
    expect(page).to have_selector('.advertisement_images', text: 'invalid image type')
  end

end