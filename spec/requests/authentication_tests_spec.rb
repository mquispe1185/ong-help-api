require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "AuthenticationTests", type: :request do
  describe "Whether access is ocurring properly" do
    before(:each) do
      @current_user = FactoryBot.create(:user)
      @client = FactoryBot.create(:client)
    end

    context 'context: general authentication via API, ' do
      it "doesn't give you anything if you don't log in" do
        get api_client_path(@client)
        expect(response.status).to eq(401)
      end
  
      it 'gives you an authentication code if you are an existing user and you satisfy the password' do
        login
        # puts "#{response.headers.inspect}"
        # puts "#{response.body.inspect}"
        expect(response.has_header?('access-token')).to eq(true)
      end
  
      it 'gives you a status 200 on signing in ' do
        login
        expect(response.status).to eq(200)
      end
  
      it 'first get a token, then access a restricted page' do
        login
        auth_params = get_auth_params_from_login_response_headers(response)
        new_client = FactoryBot.create(:client)
        get api_find_client_by_name_path(new_client.name), headers: auth_params
        expect(response).to have_http_status(:success)
      end
  
      it 'deny access to a restricted page with an incorrect token' do
        login
        auth_params = get_auth_params_from_login_response_headers(response).tap do |h|
          h.each do |k, _v|
            if k == 'access-token'
              h[k] = '123'
            end end
        end
        new_client = FactoryBot.create(:client)
        get api_find_client_by_name_path(new_client.name), headers: auth_params
        expect(response).not_to have_http_status(:success)
      end
  end
end
