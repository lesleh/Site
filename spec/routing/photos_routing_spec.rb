require 'rails_helper'

RSpec.describe PhotosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/photos").to route_to("photos#index")
    end

    it "routes to #index json" do
      expect(:get => "/photos.json").to route_to("photos#index", :format => 'json')
    end

  end
end
