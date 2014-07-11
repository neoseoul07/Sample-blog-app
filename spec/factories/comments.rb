# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commentable_id 1
    body "MyText"
    commentable_type "MyString"
  end
end
