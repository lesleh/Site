require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :slug => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input#page_title[name=?]", "page[title]"

      assert_select "input#page_slug[name=?]", "page[slug]"

      assert_select "textarea#page_body[name=?]", "page[body]"
    end
  end
end
