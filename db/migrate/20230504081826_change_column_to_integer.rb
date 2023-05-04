class ChangeColumnToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation, :integer
    change_column :recipes, :cooking, :integer
  end
end
