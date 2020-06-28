# frozen_string_literal: true
require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe '#GET/Index' do
    it 'renders a successful response' do
      create(:valid_advertisement)
      get root_path
      expect(response).to be_successful
    end
  end
end