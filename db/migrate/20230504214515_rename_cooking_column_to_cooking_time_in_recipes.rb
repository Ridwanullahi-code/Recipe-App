class RenameCookingColumnToCookingTimeInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :cooking, :cooking_time
  end
end
