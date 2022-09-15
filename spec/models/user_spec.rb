require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'should validate name' do
    should validate_presence_of(:name)
  end

  it 'should validate image' do
    should validate_presence_of(:image)
  end

  it 'should validate email' do
    should validate_presence_of(:email)
  end

end
