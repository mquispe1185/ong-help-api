require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { FactoryBot.create(:city) }
  
  it 'should validate name' do
    should validate_presence_of(:name)
  end
end
