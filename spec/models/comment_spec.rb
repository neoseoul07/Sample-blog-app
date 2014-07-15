require 'spec_helper'
require 'faker'
require 'factory_girl_rails'

RSpec.describe Comment, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
it "is invalid if the comment is empty" do
	FactoryGirl.build(:comment, body: nil).should_not be_valid
end

end
