require 'spec_helper'
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
        end

    it "renders the new template" do
      #expect(subject).to render_template(:new)
      #sign_out(@user)
      get :new
      expect(subject).to render_template("new")
      #expect(subject).to render_template("blogs/new")
    end
    
    it "redirects to show page after creating blog" do
      blog_params={ :title=> "kjsdnvs", description: "dsjkvnskjnvskjfnb" }
      post :create, blog: blog_params  
      #Blog.create(:id=> 2, :title=> "kjsdnvs", description: "dsjkvnskjnvskjfnb")
      #get :show, id: b.id
     expect(subject).to redirect_to Blog.last
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

    it "redirects to root path if user is not signed in" do
     sign_out(@user)
      get :index
      #if user_signed_in?
      # logout @u
      expect(subject).to redirect_to root_path
    end

    it "redirects to root_path if user is not signed in" do
      sign_out(@user)
      b=FactoryGirl.create(:blog)
      get :edit, id: b.id
      expect(subject).to redirect_to root_path
    end

    it "redirects to blogs_url if user is signed in and have no permissions" do
      b=FactoryGirl.create(:blog)
      #b.user_id=@user.id
      get :edit, id: b.id
     # expect(subject).to render_template("edit")
     expect(subject).to redirect_to blogs_url
     end

    it "renders edit template if user is signed in and have permissions" do
      b=FactoryGirl.create(:blog)
      b.user_id=@user.id
      b.save!
      #puts b.user_id
      get :edit, id: b.id
      #expect(assigns(:blog)).to eq(b)
      expect(subject).to render_template("edit")
     end

    it "deletes and redirects to blogs_url if user has permissions" do
      b=FactoryGirl.create(:blog)
      b.user_id=@user.id
      b.save!
      delete :destroy, id: b.id
      expect(subject).to redirect_to blogs_url
    end

    it "updates and redirects to show page after updating" do
      b=FactoryGirl.create(:blog)
      b.user_id=@user.id
      b.save!
      blog_params={ title: "kjsdnvs", description: "dsjkvnskjnvskjfnb" }
      patch :update, id: b.id, blog: blog_params
      b.reload  
      #Blog.create(:id=> 2, :title=> "kjsdnvs", description: "dsjkvnskjnvskjfnb")
      #get :show, id: b.id
     expect(subject).to redirect_to b
   end

   it "renders edit if update params are invalid" do
    b=FactoryGirl.create(:blog)
      b.user_id=@user.id
      b.save!
      blog_params={ title: "kjsdnvsdgdsdrgs", description: "dsjkvnskjnvskjfnb" }
      patch :update, id: b.id, blog: blog_params
      b.reload  
      #Blog.create(:id=> 2, :title=> "kjsdnvs", description: "dsjkvnskjnvskjfnb")
      #get :show, id: b.id
     expect(subject).to render_template("edit")
   end
  end
