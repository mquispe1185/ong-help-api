require 'rails_helper'

RSpec.describe User, type: :model do
  #it { should validate_presence_of(:name) }
  it 'should validate name' do
    user = FactoryBot.create(:user)
    should validate_presence_of(:name)
  end
  # it { should validate_presence_of(:email) }
  # it { should validate_presence_of(:password) }
  it 'my pending tests'
  it 'should default role to be 0' do
    user = FactoryBot.create(:user)
    expect(user.role).to be 0
  end
end