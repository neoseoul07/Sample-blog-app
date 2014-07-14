require 'faker'

FactoryGirl.define do
	factory :blog do
		user_id Faker::Number.digit
		description Faker::Lorem.characters(11)
		title Faker::Lorem.characters(9)
	end
end