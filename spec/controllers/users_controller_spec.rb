require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)

  #  @user =  User. create!(email: "seychiki1@yahoo.co.uk", password: "Cryovial1")
  #  @user2 = User. create!(email: "seychiki2@yahoo.co.uk", password: "Cryovial2")
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

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, params: { user: FactoryGirl.create(:user) }
        }.to change(User,:count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new user" do
        expect{
          post :create, params: { user: FactoryGirl.create(:user, password: "10") }
        }.to raise_error(/Password is too short/)
      end
    end
  end

end
