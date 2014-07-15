require 'spec_helper'
describe BlogsController, :type => :controller  do 
	describe "GET#new" do
		subject{ get :new }
		it "renders the new template" do
      expect(subject).to render_template(:new)
      expect(subject).to render_template("new")
      expect(subject).to render_template("blogs/new")
    end
  end

  	#describe "GET#:id" do
  	#	subject { :action => :show, get :id }
  	#	it "redirects_to /widgets/:id" do
     # expect(subject).to render_template(:show)
    #end
#end
#describe "GET#blogs/:id" do
#	it "renders the show page" do
#expect(:get => "/blogs/1").to render_template(:show)
#expect(:get => "/blogs/1").to render_template("show")
#end
#end


end
	
