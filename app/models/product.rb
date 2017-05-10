class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, :description, :image_url, :colour, :price, presence: true

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

end
