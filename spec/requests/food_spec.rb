require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) do
    User.create(name: 'Alex', email: 'example@example.com', password: 'password', confirmed_at: Time.current)
  end
  let(:food) { Food.create(name: 'Flour', price: 0.50, measurement: 'gram', user: user) }
  let!(:recipes) do
    [
      Recipe.create(name: 'Recipe 1', description: 'This is recipe 1', user: user, public: true, preparation_time: 10,
                    cooking_time: 20),
      Recipe.create(name: 'Recipe 2', description: 'This is recipe 2', user: user, public: true, preparation_time: 15,
                    cooking_time: 25),
      Recipe.create(name: 'Recipe 3', description: 'This is recipe 3', user: user, public: true, preparation_time: 20,
                    cooking_time: 30)
    ]
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(food.user).to eq(user)
    end

    it 'destroys dependent recipe_foods when destroyed' do
      food.recipe_foods.create(recipe: recipes[2])
      expect { food.destroy }.to change { RecipeFood.count }.by(-1)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      food.name = nil
      expect(food).not_to be_valid
    end

    it 'validates presence of price' do
      food.price = nil
      expect(food).not_to be_valid
    end

    it 'validates presence of measurement_unit' do
      food.measurement = nil
      expect(food).not_to be_valid
    end
  end
end
