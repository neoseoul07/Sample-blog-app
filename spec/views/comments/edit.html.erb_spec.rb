require 'rails_helper'

RSpec.describe "comments/edit", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :commentable_id => 1,
      :body => "MyText",
      :commentable_type => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_commentable_id[name=?]", "comment[commentable_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_commentable_type[name=?]", "comment[commentable_type]"
    end
  end
end
