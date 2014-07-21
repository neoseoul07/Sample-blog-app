Feature: Viewer signs up form
In order to use the website
As a user of the website
I want to be able to sign up and sign in

Scenario: View signup page
Given I am on "users/sign_up"
Then I should see "Sign up"


Scenario: View signin page
Given I am on "users/sign_in"
Then I should see "Sign in"

Scenario: See all the blogs
Given I am an authenticated user
When I click "Blogs here"
Then I should see "Listing blogs"

Scenario: create a new blog
Given I am an authenticated user
When I click "Blogs here"
And I click "New Blog"
And I fill in "Title" with "heheh"
And I fill in "Description" with "jhfsdbvjssjf"
And I click "Create Blog"
Then I should see "Blog was successfully created."

Scenario: show created blog
Given I am an authenticated user
And I have created a blog
When I click "Back"
And I click "Show"
Then I should see "Comments"

Scenario: edit created blog
Given I am an authenticated user
And I have created a blog
When I click "Back"
And I click "Edit"
And I fill in "Title" with "sndfnms"
And I fill in "Description" with "HJJHBNBKJKMNKsdf"
And I click "Update Blog"
Then I should see "Blog was successfully updated."

Scenario: destroy created blog
Given I am an authenticated user
And I have created a blog
When I click "Back"
And I click "Destroy"
Then I should see "Blog was successfully destroyed."





