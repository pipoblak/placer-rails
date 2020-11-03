class Brand < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :product

  validates :name, presence: true

end
