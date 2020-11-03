class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one :brand
  has_one :category

  validates :name, :title, :description, :specifications, :ean, :is_available, :category_id, :brand_id, presence: true
  
  validates :width, :height, :length, numericality: { greater_than: 0 }
  

end
