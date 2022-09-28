require 'rails_helper'

RSpec.describe "/ongs", type: :request do

  before(:each) do
    @current_user = FactoryBot.create(:user)
    @new_auth_header = @current_user.create_new_auth_token
  end

  let(:category) { FactoryBot.create(:category) }
  let(:province) { FactoryBot.create(:province) }
  let(:city)     { FactoryBot.create(:city) }

  let(:valid_attributes) {
    { "name" => "Ong Name",
      "category_id" => category.id,
      "province_id" => province.id,
      "city_id" => city.id,
      "user_id" => @current_user.id,
      "updated_by_id" => @current_user.id,
      "description" => Faker::Lorem.sentence,
      "phone" => Faker::Number.number(digits: 10),
      "email" => Faker::Internet.email,
      "video_url" => Faker::Internet.url }
  }

  let(:invalid_attributes) {
    { "name" => "",
      "category_id" => category.id,
      "province_id" => province.id,
      "city_id" => city.id,
      "user_id" => @current_user.id,
      "updated_by_id" => @current_user.id,
      "description" => Faker::Lorem.sentence,
      "phone" => Faker::Number.number(digits: 10),
      "email" => Faker::Internet.email,
      "video_url" => Faker::Internet.url }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Ong.create! valid_attributes
      get ongs_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ong = Ong.create! valid_attributes
      get ong_url(ong), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ong" do
        expect {
          post ongs_url,
              params: { ong: valid_attributes }, headers: @new_auth_header
        }.to change(Ong, :count).by(1)
      end

      it "renders a JSON response with the new ong" do
        post ongs_url,
            params: { ong: valid_attributes }, headers: @new_auth_header
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Ong" do
        expect {
          post ongs_url,
              params: { ong: invalid_attributes }, as: :json
        }.to change(Ong, :count).by(0)
      end

      it "renders a JSON response with errors for the new ong" do
        post ongs_url,
            params: { ong: invalid_attributes }, headers: @new_auth_header
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { "name" => "New Ong Name" }
      }

      it "updates the requested ong" do
        ong = Ong.create! valid_attributes
        patch ong_url(ong),
              params: { ong: new_attributes }, headers: @new_auth_header
        ong.reload
        expect(assigns(:ong).attributes['name']).to eq(new_attributes['name'])
      end

      it "renders a JSON response with the ong" do
        ong = Ong.create! valid_attributes
        patch ong_url(ong),
              params: { ong: new_attributes }, headers: @new_auth_header
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the ong" do
        ong = Ong.create! valid_attributes
        patch ong_url(ong),
              params: { ong: invalid_attributes }, headers: @new_auth_header
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ong" do
      ong = Ong.create! valid_attributes
      expect {
        delete ong_url(ong), headers: @new_auth_header
      }.to change(Ong, :count).by(-1)
    end
  end
end
