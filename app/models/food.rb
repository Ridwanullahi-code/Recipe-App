class Food < ApplicationRecord
  belongs_to :user
  has_many :inventoryfoods
  has_many :inventory, through: :inventory_foods
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  attribute :price, :decimal, precision: 4, scale: 2
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
