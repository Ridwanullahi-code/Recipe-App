class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, foreign_key: 'inventory_id', dependent: :destroy
  has_many :foods, through: :inventory_foods, dependent: :destroy
end
