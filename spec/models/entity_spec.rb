require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create!(
      full_name: 'Hope',
      email: 'hope@example.com',
      password: '1234567'
    )
  end

  let(:category) do
    Category.create!(
      name: 'Lunch',
      icon: 'lunch.icon',
      user: user
    )
  end

  subject do
    Entity.new(
      name: "Lunch",
      amount: 20,
      category: category
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "should have amount" do
    subject.amount = nil
    expect(subject).not_to be_valid
  end


  it "should have catrgory" do
    subject.category_id = nil
    expect(subject).not_to be_valid
  end
end
