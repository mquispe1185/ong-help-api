require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should validate uid' do
    user = FactoryBot.create(:user)
    should validate_presence_of(:uid)
  end

  it 'should validate name' do
    user = FactoryBot.create(:user)
    should validate_presence_of(:name)
  end

  it 'should validate image' do
    user = FactoryBot.create(:user)
    should validate_presence_of(:image)
  end

  it 'should validate email' do
    user = FactoryBot.create(:user)
    should validate_presence_of(:email)
  end

  it 'should default role to be 0' do
    user = FactoryBot.create(:user)
    expect(user.role).to eq('donor')
  end
end
