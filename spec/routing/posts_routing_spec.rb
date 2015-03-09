require 'rails_helper'

RSpec.describe PostsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("posts#index")
    end

    it "routes to #new" do
      expect(:get => "/blog/new").to route_to("posts#new")
    end

    it "routes to #show" do
      expect(:get => "/blog/first-post").to route_to("posts#show", :id => "first-post")
    end

    it "routes to #edit" do
      expect(:get => "/blog/first-post/edit").to route_to("posts#edit", :id => "first-post")
    end

    it "routes to #create" do
      expect(:post => "/blog").to route_to("posts#create")
    end

    it "routes to #update" do
      expect(:put => "/blog/first-post").to route_to("posts#update", :id => "first-post")
    end

    it "routes to #destroy" do
      expect(:delete => "/blog/first-post").to route_to("posts#destroy", :id => "first-post")
    end

  end
end
