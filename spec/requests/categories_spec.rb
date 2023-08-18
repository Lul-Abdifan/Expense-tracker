require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before(:each) do
      User.create!(
        full_name: 'Hope',
        email: 'hope@example.com',
        password: '1234567'
      )
    end

    it 'works! (now write some real specs)' do
      post '/users/sign_in', params: { user: { email: 'hope@example.com', password: '1234567' } }

      get categories_path
      expect(response).to be_successful
    end

    it 'Should show Add Category' do
      post '/users/sign_in', params: { user: { email: 'hope@example.com', password: '1234567' } }

      get categories_path
      expect(response.body).to include('Add Category')
    end
  end
end
