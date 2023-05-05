class ChangePlublicToPublicInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :plublic, :public
  end
end
