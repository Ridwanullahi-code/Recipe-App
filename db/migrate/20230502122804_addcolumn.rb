class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :name, :string
  end
end
