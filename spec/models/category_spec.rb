require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create(:category) }

  it 'should validate name' do
    should validate_presence_of(:name)
  end
end
