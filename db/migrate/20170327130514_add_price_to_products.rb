class AddPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal
    if column_exists? :table_name, :column_name
               remove_column :table_name, :column_name
  end
end
