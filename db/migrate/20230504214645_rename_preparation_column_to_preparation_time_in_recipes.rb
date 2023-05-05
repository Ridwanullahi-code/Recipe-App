class RenamePreparationColumnToPreparationTimeInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :preparation, :preparation_time
  end
end
