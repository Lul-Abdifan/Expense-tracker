require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create!(
      full_name: 'Hope',
      email: 'hope@example.com',
      password: '1234567'
    )
  end

  subject do
    Category.new(
      name: "Lunch",
      icon: "lunch.icon",
      user: user
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "should have an email" do
    subject.icon = nil
    expect(subject).not_to be_valid
  end
end
