require "rails_helper"

RSpec.describe EntityLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/entity_links").to route_to("entity_links#index")
    end

    it "routes to #show" do
      expect(get: "/entity_links/1").to route_to("entity_links#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/entity_links").to route_to("entity_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/entity_links/1").to route_to("entity_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/entity_links/1").to route_to("entity_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/entity_links/1").to route_to("entity_links#destroy", id: "1")
    end
  end
end
