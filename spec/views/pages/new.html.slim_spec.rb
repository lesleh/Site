require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      :title => "MyString",
      :slug => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input#page_title[name=?]", "page[title]"

      assert_select "input#page_slug[name=?]", "page[slug]"

      assert_select "textarea#page_body[name=?]", "page[body]"
    end
  end
end
