require 'rails_helper'

RSpec.describe "Searches", type: :request do

  let(:valid_headers) {
    {}
  }

  let(:valid_params) {
    {"q" => "1"}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get search_index_url, headers: valid_headers, params: valid_params, as: :json
      expect(response).to be_successful
    end
  end
  
end
