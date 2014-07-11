require 'rails_helper'

RSpec.describe "comments/index", :type => :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :commentable_id => 1,
        :body => "MyText",
        :commentable_type => "Commentable Type"
      ),
      Comment.create!(
        :commentable_id => 1,
        :body => "MyText",
        :commentable_type => "Commentable Type"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Commentable Type".to_s, :count => 2
  end
end
