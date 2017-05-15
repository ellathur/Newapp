require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
     @product = Product.create!(name: "coffee mojo")
     @user = User. create!(email: "seychiki@yahoo.co.uk", password: "Cryovial")
     @product.comments.create!(rating: 1, user: @user, body: "delicious")
     @product.comments.create!(rating: 3, user: @user, body: "extra delicious")
     @product.comments.create!(rating: 5, user: @user, body: " super delicious")
    end
    it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
    end
  end
  it "is not valid" do
    expect(Product.new(description: "Nice Coffee")).not_to be_valid
  end
end
