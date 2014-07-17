require 'spec_helper'

RSpec.describe CommentsController, :type => :controller do
	before(:each) do
DatabaseCleaner.clean
#@comment=FactoryGirl.create(:comment)
#@comment.save!
@user=FactoryGirl.create(:user)
@user.save!
sign_in(@user)
end

it "redirects to blog_path after creating comment" do
	b=FactoryGirl.create(:blog)
	post :create, blog_id: b.id, comment:{body: "jhsbdhjsvs"}
	#puts Comment.last.body
	expect(subject).to redirect_to b
end

it "redirect_to blog_path after deleting comment" do
	b=FactoryGirl.create(:blog)
	c=FactoryGirl.create(:comment)
	c.blog_id=b.id
	c.save!
	delete :destroy, id: c.id
	#c = Comment.find(c.id)
	#puts c.blog_id
	expect(subject).to redirect_to b
end


end
