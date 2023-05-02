class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :preparation_time, :preparation
    rename_column :recipes, :cooking_time, :cooking
  end
end
