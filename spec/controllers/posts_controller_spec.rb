require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        title: 'First Post',
        body: '<p>This is my first post.</p>'
    }
  }

  let(:invalid_attributes) {
    {
    }
  }

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      http_login
      get :new, {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      http_login
      post = Post.create! valid_attributes
      x = post.to_param
      get :edit, {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      http_login
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      http_login
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end
