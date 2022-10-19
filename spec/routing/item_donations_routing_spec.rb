require "rails_helper"

RSpec.describe ItemDonationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/item_donations").to route_to("item_donations#index")
    end

    it "routes to #show" do
      expect(get: "/item_donations/1").to route_to("item_donations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/item_donations").to route_to("item_donations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/item_donations/1").to route_to("item_donations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/item_donations/1").to route_to("item_donations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/item_donations/1").to route_to("item_donations#destroy", id: "1")
    end
  end
end
