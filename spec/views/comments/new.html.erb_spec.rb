require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :title => "MyString",
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_title", :name => "comment[title]"
      assert_select "textarea#comment_comment", :name => "comment[comment]"
    end
  end
end
