require "rails_helper"

RSpec.describe OngsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ongs").to route_to("ongs#index")
    end

    it "routes to #show" do
      expect(get: "/ongs/1").to route_to("ongs#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ongs").to route_to("ongs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ongs/1").to route_to("ongs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ongs/1").to route_to("ongs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ongs/1").to route_to("ongs#destroy", id: "1")
    end
  end
end
