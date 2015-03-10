require 'rails_helper'

RSpec.describe Message, :type => :model do

  let(:valid_attributes) {
    {
        name: "John Smith",
        email: "john.smith@example.com",
        subject: "Hey There!",
        body: "This is a test message."
    }
  }

  describe "creation" do
    it "creates a message" do
      message = Message.create!(valid_attributes)
      expect(message.name).to eq(valid_attributes[:name])
      expect(message.email).to eq(valid_attributes[:email])
      expect(message.subject).to eq(valid_attributes[:subject])
      expect(message.body).to eq(valid_attributes[:body])
    end
  end

  describe "validation" do
    it "requires a name" do
      message = Message.create(valid_attributes.except(:name))
      expect(message.valid?).to be(false)
    end

    it "requires a email" do
      message = Message.create(valid_attributes.except(:email))
      expect(message.valid?).to be(false)
    end

    it "requires a valid email" do
      message = Message.create(valid_attributes.except(:email))
      message.email = 'invalid'
      expect(message.valid?).to be(false)
    end

    it "requires a subject" do
      message = Message.create(valid_attributes.except(:subject))
      expect(message.valid?).to be(false)
    end

    it "requires a body" do
      message = Message.create(valid_attributes.except(:body))
      expect(message.valid?).to be(false)
    end
  end

end