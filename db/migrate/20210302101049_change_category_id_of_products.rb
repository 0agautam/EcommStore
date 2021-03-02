class ChangeCategoryIdOfProducts < ActiveRecord::Migration[6.1]
  def change
  	change_column :products, :category_id, 'integer USING CAST(category_id AS integer)'
  end
end
