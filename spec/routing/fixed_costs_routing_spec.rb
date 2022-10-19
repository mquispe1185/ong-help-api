require "rails_helper"

RSpec.describe FixedCostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fixed_costs").to route_to("fixed_costs#index")
    end

    it "routes to #show" do
      expect(get: "/fixed_costs/1").to route_to("fixed_costs#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fixed_costs").to route_to("fixed_costs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fixed_costs/1").to route_to("fixed_costs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fixed_costs/1").to route_to("fixed_costs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fixed_costs/1").to route_to("fixed_costs#destroy", id: "1")
    end
  end
end
