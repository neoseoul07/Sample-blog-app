require 'spec_helper'

RSpec.describe WelcomeController, :type => :controller do

	it "renders the index page" do
		get :index 
		expect(subject).to render_template("index")
	end
end