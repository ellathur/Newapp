class RenameToColoursInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :colour, :colour
  end
end
