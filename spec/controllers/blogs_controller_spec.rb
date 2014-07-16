require 'spec_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
#include Warden::Test::Helpers
#include Devise::Test::Helpers
#Warden.test_mode!
describe BlogsController, :type => :controller  do 
	


before(:each) do
DatabaseCleaner.clean
#Warden.test_reset!
@user=FactoryGirl.create(:user)
@user.save
sign_in(@user)
#@user.current_sign_in_at=Time.now
end


it "should have a current_user" do
    @user.should_not be_nil
    #current_user
    # Warden.test_reset!
  end

  # logout(:user)
  
#logout
    it "renders the new template" do
      #expect(subject).to render_template(:new)
      #sign_out(@user)
      get :new
#expect(subject).to redirect_to root_path
      expect(subject).to render_template("new")
      #expect(subject).to render_template("blogs/new")
    end
    
    it "renders show template after creating blog" do
    b=FactoryGirl.create(:blog)
      post :create, :blog => {title: b.title, description: b.description}
      get :show, id: b.id
      expect(subject).to render_template("show")
    end

    it "redirects to root_path if blogs params are not validated" do
      b=Blog.create(:title=>"kjdfnskjdbvsvsn", :description=>"bdvsjdbvnsfbsnbksnbsjb")
      post :create, :blog => {title: b.title, description: b.description}
      #get :show, id: b.id
     expect(subject).to render_template("new")
   end

    it "redirects to root path if user is not signed in" do
     sign_out(@user)
      #b = FactoryGirl.create(:blog)
      #sign_out(@user)
      get :new
      #if user_signed_in?
      # logout @u
      expect(subject).to redirect_to root_path
    end

    #login_user(FactoryGirl.create(:user))
  	it "renders the show page if user is signed in" do
     #sign_out(@user)
      b = FactoryGirl.create(:blog)
      #sign_out(@user)
      get :show, id: b.id
      #if user_signed_in?
      # logout @u
      expect(subject).to render_template("show")
      #end
      #  expect(subject).to render_template(:show)
#      expect(subject).to redirect_to(:root_path)
  #  end
  end

  it "redirects to root path if user is not signed in" do
     sign_out(@user)
      b = FactoryGirl.create(:blog)
      #sign_out(@user)
      get :show, id: b.id
      #if user_signed_in?
      # logout @u
      expect(subject).to redirect_to root_path
    end


    it "renders the index page if user is signed in" do
      get :index
      expect(subject).to render_template("index")
    end
     # expect(subject)

    it "redirects to root path if user is not signed in" do
     sign_out(@user)
#      b = FactoryGirl.create(:blog)
      #sign_out(@user)
      get :index
      #if user_signed_in?
      # logout @u
      expect(subject).to redirect_to root_path
    end

  
end
