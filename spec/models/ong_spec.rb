require 'rails_helper'

RSpec.describe Ong, type: :model do
  let(:ong) { FactoryBot.create(:ong) }

  it 'should validate name' do
    should validate_presence_of(:name)
  end

  it 'should validate description' do
    should validate_presence_of(:description)
  end

  it 'should validate phone' do
    should validate_presence_of(:phone)
  end

  it 'should validate email' do
    should validate_presence_of(:email)
  end

  it 'should validate video_url' do
    should validate_presence_of(:video_url)
  end
end
