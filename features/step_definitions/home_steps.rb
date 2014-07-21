Given /^I am on the home page$/ do
  visit "/"
end

Given(/^I am on "(.*?)"$/) do |arg1|
#  pending # express the regexp above with the code you wish you had
visit arg1

end
 
Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should see "(.*?)" in a link$/ do |arg1|
	page.should have_link arg1
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
  fill_in element, with: text
end
 
When /^I click "([^"]*)"$/ do |element|
  click_on element
end

Given(/^I am an authenticated user$/) do
  #pending # express the regexp above with the code you wish you had
u=FactoryGirl.build(:user)
visit new_user_registration_path
fill_in "Email", with: u.email
fill_in "Password", with: u.password
fill_in "Password confirmation", with: u.password
click_on "Sign up"
page.should have_content "Welcome"
end

Given(/^I have created a blog$/) do
 # pending # express the regexp above with the code you wish you had
 step %Q{I click "Blogs here"}
 step %Q{I click "New Blog"}
	step %Q{I fill in "Title" with "heheh"}
	step %Q{I fill in "Description" with "jhfsdbvjssjf"}
	step %Q{I click "Create Blog"}
end