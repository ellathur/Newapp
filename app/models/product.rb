class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, :description, :image_url, :colour, :price, presence: true

  include PgSearch
  pg_search_scope :search_by_name, :against => :name

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  def self.search(search_term)
    if search_term.present?
      search_by_name(search_term)
    else
      pass
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  end

end
