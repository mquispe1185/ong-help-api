require 'rails_helper'

RSpec.describe Ong, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city_id) }
  it { should validate_presence_of(:province_id) }
  it { should validate_presence_of(:user_id) }
end
