class AddDetailsToAccounts < ActiveRecord::Migration[6.1]
  def change
  	add_column :accounts, :user_id, :integer
  	add_column :accounts, :account_number, :integer
  end
end
