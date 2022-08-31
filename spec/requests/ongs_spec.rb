require 'rails_helper'

RSpec.describe "Ongs API", type: :request do

  let!(:ongs) { create_list(:ong, 10) }
  let(:ong_id) { ongs.first.id }
  describe "GET /index" do
    before { get ongs_path }
    it 'returns ongs' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before {  get ong_url(ongs.first)}
    it 'returns ong' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(ongs.first.id)
    end

    it "returns Show http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:ong_attributes) { nested_attributes_for(:ong) }
    context 'when the request is valid' do
      before { post ongs_path, params: {ong: ong_attributes } }

      it 'creates an ong' do
        expect(json['id']).not_to be_nil
        expect(json['name']).not_to be_nil
      end

      it 'returns status code 201 created' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "put /update" do
    let(:valid_attributes) { { name: 'new Name' } }
    before { put "/ongs/#{ongs.first.id}", params: {ong: valid_attributes} }
    it "returns record with new name" do
      expect(json['name']).to eq('new Name')
    end

    it "returns http success on update" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    before { delete "/ongs/#{ongs.first.id}" }
    it 'returns ongs but destroyed' do
      expect(json).not_to be_empty
      expect(json.size).to eq(9)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
