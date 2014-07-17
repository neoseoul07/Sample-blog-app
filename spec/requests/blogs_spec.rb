require 'spec_helper'

# Request specs for the invoices controller.
describe "Blogs" do
    # Runs before each test.
    before do
        # Sign in as a user.
        sign_in_as_a_valid_user
    end

    describe "GET /blogs" do
        it "Gives is the expected status code." do
            # Invoke the request we're testing.
            get blogs_path
            #expect(response).to render_template("index")
            # Ensure we get the expected response code.
            response.status.should be(200)

        end
    end

    
end
