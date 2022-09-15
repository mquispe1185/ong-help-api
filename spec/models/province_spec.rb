require 'rails_helper'

RSpec.describe Province, type: :model do
  let(:province) { FactoryBot.create(:province) }

  it 'should validate name' do
    should validate_presence_of(:name)
  end
end
