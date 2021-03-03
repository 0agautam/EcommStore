class RemoveProductIdFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :product_id, :integer
  end
end
