class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_food, foreign_key: 'recipe_id', dependent: :delete
end
