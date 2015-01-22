require 'rails_helper'

RSpec.describe PhotosController, :type => :routing do
  describe "routing" do

    it "routes to #login" do
      expect(:get => "/session/login").to route_to("session#login")
    end

    it "routes to #logout" do
      expect(:get => "/session/logout").to route_to("session#logout")
    end

  end
end
