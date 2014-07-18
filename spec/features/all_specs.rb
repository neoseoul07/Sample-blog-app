require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
describe "the signin process", :type => :feature do
  #before :each do
  DatabaseCleaner.clean
    FactoryGirl.create(:user)
  #end

  it "signs me in" do
    visit '/users/sign_in'
    #within("#session") do
      fill_in 'Email', :with => 'tavva@gmail.com'
      fill_in 'Password', :with => 'secret123'
    #end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

end

describe "the signup process", :type => :feature do
  DatabaseCleaner.clean
 user = FactoryGirl.create(:user)
 it "signs me up" do
    visit  new_user_registration_path 
    fill_in "Email" , with: user.email
    fill_in "Password", with: user.password
    fill_in "confirm", with: user.password
    click_button 'Sign up'
  end
end

describe "creating a blog", type: :feature do
  it "creates a new blog" do
  DatabaseCleaner.clean
  user = FactoryGirl.create(:user)
    login_as(user, :scope=> :user)
    blog = FactoryGirl.create(:blog)
    visit new_blog_path
  fill_in "Title", with: 'ccesdc'
    fill_in "Description", with: 'egdsfdbdetrfdca'
    click_button 'Create Blog'
    expect(page).to have_content "Blog was successfully created"
  end
end

describe "showing blogs", type: :feature do
  it "shows all the blogs" do
    DatabaseCleaner.clean
    user=FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link 'Blogs here'
    expect(page).to have_content "Listing blogs"
  end
end

describe "showing blog", type: :feature do
  it "shows the blog" do
    DatabaseCleaner.clean
    blog=FactoryGirl.create(:blog)
    user=FactoryGirl.create(:user)
    blog.user_id=user.id
    login_as(user, :scope => :user)
    visit blogs_path
    click_link 'show'
    puts blog.user.email
    expect(page).to have_content "Comments"
  end
end


