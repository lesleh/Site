require 'rails_helper'

RSpec.describe Pun, :type => :model do
  it "creates a pun" do
    text = "Velcro, what a rip off."
    pun = Pun.create!(text: text)
    expect(pun.text).to eq(text)
  end

  it "requires a text" do
    pun = Pun.create
    expect(pun.valid?).to be(false)
  end
end
