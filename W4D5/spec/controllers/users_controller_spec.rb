require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
      it "renders the new user page" do
        # this line simulates a "GET" request to the LinksController that hits the #new method, passing in `{link: {}}` as params.
        get :new

        # here we check to make sure that the response renders back the new template
        expect(response).to render_template("new")
        expect(response).to have_http_status(200)
      end
    end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of title and body" do
        post :create, user: {title: "this is an invalid link"}
        expect(response).to redirect_to(new_user_url)
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the link show page" do
        post :create, user: { username: 'hfeger', password: 'asfesfwefasfsr' }
        expect(response).to redirect_to(user_url(User.first))
      end
    end
  end
end
