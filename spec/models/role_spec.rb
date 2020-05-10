require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'roles table' do
    it{is_expected.to have_db_column :id}
    it{is_expected.to have_db_column :name}
    it{is_expected.to have_db_column :created_at}
    it{is_expected.to have_db_column :updated_at}
    it{is_expected.to have_db_column :name}
  end
  describe '#validate attributes' do
    subject { create(:role)}
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_uniqueness_of(:name)}
    it { is_expected.to have_many(:users)}
  end
end
