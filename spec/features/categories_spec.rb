require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) do
    User.create!(
      full_name: 'Hope',
      email: 'hope@example.com',
      password: '1234567'
    )
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit categories_path
  end

  it 'shows the category page' do
    expect(page).to have_content('Categories')
  end

  it 'shows the category page' do
    expect(page).to have_link('Add Category')
  end

  it 'Shows category forms' do
    click_link('Add Category')
    expect(page).to have_content('New category')
  end

  it 'Shows category forms' do
    click_link('Add Category')
    expect(current_path).to eq(new_category_path)
  end
end
