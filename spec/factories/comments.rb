require 'faker'

FactoryGirl.define do
	factory :comment do
		user_id Faker::Number.digit
		blog_id 7
		body Faker::Lorem.characters(11)
	end
end