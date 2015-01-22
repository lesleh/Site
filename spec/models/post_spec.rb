require 'rails_helper'

RSpec.describe Post, :type => :model do

  let(:valid_attributes) {
    {
        title: "Another Post",
        body: "<p>This is another blog post.</p>"
    }
  }

  let(:valid_slug) {
    "another-post"
  }

  describe "creation" do
    it "creates a post" do
      post = Post.create!(valid_attributes)
      expect(post.title).to eq(valid_attributes[:title])
      expect(post.body).to eq(valid_attributes[:body])
    end

    it "creates a slug automatically" do
      post = Post.create!(valid_attributes)
      expect(post.slug).to eq(valid_slug)
    end
  end

  describe "validation" do
    it "requires a title" do
      post = Post.create(valid_attributes.except(:title))
      expect(post.valid?).to be(false)
    end

    it "requires a body" do
      post = Post.create(valid_attributes.except(:body))
      expect(post.valid?).to be(false)
    end
  end

end