class Food < ApplicationRecord
  belongs_to :user
  has_many :inventorys_food, foreign_key: 'food_id', dependent: :delete
  has_many :recipes_food, foreign_key: 'food_id', dependent: :delete
  
  validates :prices, numericality: {greater_than_or_equal_to: 0}
  attribute :price, :decimal, precision: 4, scale: 2
end
