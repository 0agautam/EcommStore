class Account < ApplicationRecord
  belongs_to :user
  has_one :account_history
end
