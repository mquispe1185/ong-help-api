require 'rails_helper'

RSpec.describe "Mercadopagos", type: :request do
  describe "GET /checkout" do
    it "returns http success" do
      get "/mercadopago/checkout"
      expect(response).to have_http_status(:success)
    end
  end

end
