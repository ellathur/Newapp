require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user =  User. create!(email: "seychiki1@yahoo.co.uk", password: "Cryovial1")
    @user2 = User. create!(email: "seychiki2@yahoo.co.uk", password: "Cryovial2")
  end


  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads correct user details" do
        get :show, params: {id: @user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "No user is logged in" do
      it 'requires to login' do
         get :show, params: { id: @user.id }
         expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "User Not allowed to see other user show page" do
        before do
          sign_in @user2
       end
      it "redirects to root path" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(302)
      end

   end

  end

end
