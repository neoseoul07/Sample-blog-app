require 'spec_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
include Warden::Test::Helpers
Warden.test_mode!
describe BlogsController, :type => :controller  do 
	

def login_user(user)
    sign_in user
end

before(:each) do
DatabaseCleaner.clean
login_user(FactoryGirl.create(:user))
end


it "should have a current_user" do
    subject.current_user.should_not be_nil
    # Warden.test_reset!
  end

  # logout(:user)
  
describe "GET#new" do
    it "renders the new template" do
      #expect(subject).to render_template(:new)
      get :new
      expect(subject).to render_template("new")
      #expect(subject).to render_template("blogs/new")
    end
  end

  describe "GET#blogs/:id" do
    #login_user(FactoryGirl.create(:user))
  	it "renders the show page if user is signed in" do
      b = FactoryGirl.create(:blog)
      subject{get :show, id: b.id}
      expect(subject).to render_template("show")
      #  expect(subject).to render_template(:show)
#      expect(subject).to redirect_to(:root_path)
  #  end
    end
  end

  #describe "GET#index" do
   # it "renders the index page if user is signed in" do


end
