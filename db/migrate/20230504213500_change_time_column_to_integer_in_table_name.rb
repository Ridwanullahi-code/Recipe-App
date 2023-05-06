class ChangeTimeColumnToIntegerInTableName < ActiveRecord::Migration[7.0]
  def up
    add_column :recipes, :cooking_new, :integer
    add_column :recipes, :preparation_new, :integer

    Recipe.all.each do |recipe|
      recipe.update(cooking_new: recipe.cooking.to_i, preparation_new: recipe.preparation.to_i)
    end

    remove_column :recipes, :cooking
    remove_column :recipes, :preparation

    rename_column :recipes, :cooking_new, :cooking
    rename_column :recipes, :preparation_new, :preparation
  end

  def down
    add_column :recipes, :cooking_new, :time
    add_column :recipes, :preparation_new, :time

    Recipe.all.each do |recipe|
      recipe.update(cooking_new: Time.at(recipe.cooking), preparation_new: Time.at(recipe.preparation))
    end

    remove_column :recipes, :cooking
    remove_column :recipes, :preparation

    rename_column :recipes, :cooking_new, :cooking
    rename_column :recipes, :preparation_new, :preparation
  end
end
