require 'spec_helper'
require 'faker'
require 'factory_girl_rails'

describe Blog do
	before(:each) do
DatabaseCleaner.clean
end
it "has a valid factory" do
	#DatabaseCleaner.clean
FactoryGirl.create(:blog).should be_valid
end
it "is invalid without a title" do
	FactoryGirl.build(:blog, title: nil).should_not be_valid 
end 
it "is invalid without description" do
	FactoryGirl.build(:blog, description: nil).should_not be_valid
end
it "is valid if description is longer than 10 characters" do
		FactoryGirl.build(:blog, description: Faker::Lorem.characters(11)).should be_valid
	end
it "is invalid if summary is longer than 10 characters" do
		FactoryGirl.build(:blog, title: Faker::Lorem.characters(11)).should_not be_valid
	end
end
