require 'spec_helper'
require 'faker'
require 'factory_girl_rails'
describe Article do
it "has a valid factory" do
FactoryGirl.create(:article).should be_valid
end
it "is invalid without a title" do
	FactoryGirl.build(:article, title: nil).should_not be_valid 
end 
end