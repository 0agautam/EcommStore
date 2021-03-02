class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.decimal :price
      t.text :specs

      t.timestamps
    end
  end
end
