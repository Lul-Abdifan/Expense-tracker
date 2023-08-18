require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  let(:user) do
    User.create!(full_name: 'Hope', email: 'hope@gmail.com', password: '1234567')
  end
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @category = Category.create!(name: 'Lunch', icon: 'lunch.icon', user:)
    @entity = Entity.create!(name: 'doro wot', amount: 23, category: @category, author: user)
  end
  describe 'Category page' do
    it 'To click text link' do
      visit categories_path
      click_link(@category.name)
      expect(current_path).to eq category_entities_path(@category.id)
    end

    it 'To Check add new entity' do
      visit category_entities_path(@category.id)
      expect(page).to have_content('New entity')
    end

    it 'To Check add new entity' do
      visit category_entities_path(@category.id)
      click_link('New entity')
      expect(page).to have_content('New Entity')
    end
  end
end
