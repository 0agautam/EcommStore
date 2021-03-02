class User < ApplicationRecord
  has_one :cart
  has_one :account
  has_one :account_history, through: :account
  has_many :orders
end
