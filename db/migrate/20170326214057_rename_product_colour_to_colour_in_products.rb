class RenameProductColourToColourInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :Product_Colour, :colour
  end
end
