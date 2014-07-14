require 'spec_helper'
require 'faker'
require 'factory_girl_rails'
describe Blog do
it "has a valid factory" do
FactoryGirl.create(:blog).should be_valid
end
it "is invalid without a title" do
	FactoryGirl.build(:blog, title: nil).should_not be_valid 
end 
end