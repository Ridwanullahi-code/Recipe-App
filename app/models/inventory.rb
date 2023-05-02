class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventorys_food, foreign_key: 'inventory_id', dependent: :delete
end
